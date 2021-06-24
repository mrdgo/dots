--require'snippets'.snippets = {
  -- The _global dictionary acts as a global fallback.
  -- If a key is not found for the specific filetype, then
  --  it will be lookup up in the _global dictionary.
  --_global = {
    -- Evaluate at the time of the snippet expansion and insert it. You
    --  can put arbitrary lua functions inside of the =... block as a
    --  dynamic placeholder. In this case, for an anonymous variable
    --  which doesn't take user input and is evaluated at the start.
    --epoch = "${=os.time()}";
    -- Equivalent to above.
    --epoch = function() return os.time() end;

    -- Use the expansion to read the username dynamically.
    --note = [[NOTE(${=io.popen("id -un"):read"*l"}): ]];

    -- Do the same as above, but by using $1, we can make it user input.
    -- That means that the user will be prompted at the field during expansion.
    -- You can *EITHER* specify an expression as a placeholder for a variable
    --  or a literal string/snippet using `${var:...}`, but not both.
    --note = [[NOTE(${1=io.popen("id -un"):read"*l"}): ]];
  --};
  --lua = {
    -- Snippets can be used inside of placeholders, but the variables used in
    -- the placeholder *must* be used outside of the placeholder. This could
    -- potentially change in the future if someone convinces me it's a good
    -- idea to support it. (it was a deliberate choice)
    --req = [[local ${2:$1} = require '$1']];

    -- A snippet with a placeholder using :... and multiple variables.
    --["for"] = "for ${1:i}, ${2:v} in ipairs(${3:t}) do\n$0\nend";
    -- This is equivalent to above, but looks nicer (to me) using [[]] strings.
    -- Notice $0 to indicate where the cursor should go at the end of expansion.
    --["for"] = [[
--for ${1:i}, ${2:v} in ipairs(${3:t}) do
--  $0
--end]];
--  };
--}

-- And now for some examples of snippets I actually use.
local snippets = require'snippets'
local U = require'snippets.utils'
snippets.snippets = {
  _global = {
    todo = U.force_comment 'TODO (maxim): ';
  };
  python = {
    newfile = "'''\ncreated: ${=os.date('%b %d${1:i} %Y')}\n@author: Maxim Ritter von Onciul\n'''";
    class = 'class ${1}():\n\tdef __init__():\n\t\t$0';
    func = U.match_indentation 'def ${1}(${2}):\n\t$0';
    ["for"] = U.match_indentation 'for ${1} in ${2}:\n\t';
  };
}
