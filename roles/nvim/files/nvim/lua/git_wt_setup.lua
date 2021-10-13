-- Creates a worktree.  Requires the path, branch name, and the upstream
-- Example:
require("git-worktree").create_worktree("feat-69", "master", "origin")

-- switches to an existing worktree.  Requires the path name
-- Example:
require("git-worktree").switch_worktree("feat-69")

-- deletes to an existing worktree.  Requires the path name
-- Example:
require("git-worktree").delete_worktree("feat-69")

-- load telescope extension
require("telescope").load_extension("git_worktree")

-- browse with telescope
require('telescope').extensions.git_worktree.git_worktrees()
-- <Enter> - switches to that worktree
-- <c-d> - deletes that worktree
-- <c-D> - force deletes that worktree

-- create wt
require('telescope').extensions.git_worktree.create_git_worktree()
