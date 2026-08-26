---@param opts overseer.SearchParams
---@return nil|string
local function get_gemfile(opts)
  return vim.fs.find("Gemfile", { upward = true, type = "file", path = opts.dir })[1]
end

---@param cwd string
---@param name string
---@return string[]
local function bin_cmd(cwd, name)
  if vim.fn.filereadable(vim.fs.joinpath(cwd, "bin", name)) == 1 then
    return { "bin/" .. name }
  elseif vim.fn.executable("bundle") == 1 then
    return { "bundle", "exec", name }
  else
    return { name }
  end
end

---@type overseer.TemplateFileProvider
return {
  cache_key = function(opts)
    return get_gemfile(opts)
  end,
  generator = function(opts)
    local gemfile = get_gemfile(opts)
    if not gemfile then
      return "No Gemfile found"
    end
    local cwd = vim.fs.dirname(gemfile)
    local rails = bin_cmd(cwd, "rails")
    local rspec = bin_cmd(cwd, "rspec")

    local function rails_task(name, ...)
      local args = { ... }
      return {
        name = name,
        builder = function()
          return {
            cmd = vim.list_extend(vim.deepcopy(rails), args),
            cwd = cwd,
          }
        end,
      }
    end

    return {
      rails_task("rails server", "server"),
      rails_task("rails server (0.0.0.0)", "server", "-b", "0.0.0.0"),
      rails_task("rails console", "console"),
      rails_task("rails db:migrate", "db:migrate"),
      rails_task("rails db:rollback", "db:rollback"),
      rails_task("rails db:seed", "db:seed"),
      rails_task("rails routes", "routes"),
      rails_task("rails test", "test"),
      {
        name = "rails test (current file)",
        builder = function()
          return {
            cmd = vim.list_extend(vim.deepcopy(rails), { "test", vim.fn.expand("%:p") }),
            cwd = cwd,
          }
        end,
      },
      {
        name = "rspec",
        builder = function()
          return {
            cmd = vim.deepcopy(rspec),
            cwd = cwd,
          }
        end,
      },
      {
        name = "rspec (current file)",
        builder = function()
          return {
            cmd = vim.list_extend(vim.deepcopy(rspec), { vim.fn.expand("%:p") }),
            cwd = cwd,
          }
        end,
      },
    }
  end,
}
