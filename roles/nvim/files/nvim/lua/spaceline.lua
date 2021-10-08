require'galaxyline_conf'

local gl = require('galaxyline')
local gruvbox = require'gruvbox'
local colors = require'galaxyline.theme'.default
local condition = require('galaxyline.condition')
local gls = gl.section
gl.short_line_list = {'NvimTree','vista','dbui','packer', 'startify'}

gls.left[1] = {
  RainbowRed = {
    provider = function() return ' ' end,
    highlight = 'GalaxyViMode',
  },
}
gls.left[2] = {
  ViMode = {
        provider = function()
            local alias = {n = 'NORMAL',i = 'INSERT',c= 'COMMAND',v= 'VISUAL',V= 'VISUAL LINE', [''] = 'VISUAL BLOCK'}
            mode = vim.fn.mode()
            local bg_color = {n='#b8bb26', i='#fabd2f', c='83a598', v='#d3869b', V='#d3869b', ['^V']='#d3869b', }
            vim.cmd('highlight GalaxyViMode guibg='..bg_color[mode])
        return alias[mode]
    end,
    separator = ' ',
    highlight = 'GalaxyViMode',
    separator_highlight = 'GalaxyViMode',
  },
}
gls.left[3] = {
    Stuff = {
        provider = function() return ' ' end,
        highlight = 'GalaxyMapperCommon1'
    }
}
gls.left[4] = {
  FileSize = {
    provider = 'FileSize',
    condition = condition.buffer_not_empty,
    highlight = 'GalaxyMapperCommon3',
    separator = ' ',
    separator_highlight = 'GalaxyMapperCommon3',
  }
}
gls.left[5] ={
  FileIcon = {
    provider = 'FileIcon',
    condition = condition.buffer_not_empty,
    highlight = 'GalaxyLeftGitDiffAddActive'
  },
}

gls.left[6] = {
  FileName = {
    provider = 'FileName',
    condition = condition.buffer_not_empty,
    highlight = 'GalaxyMapperCommon3',
    --separator = ' ',
    separator_highlight = 'GalaxyMapperCommon3',
  }
}

gls.left[7] = {
  LineInfo = {
    provider = 'LineColumn',
    --separator = ' ',
    separator_highlight = 'GalaxyMapperCommon3',
    highlight = 'GalaxyLeftGitDiffAddActive'
  },
}

gls.left[8] = {
  DiagnosticError = {
    provider = 'DiagnosticError',
    icon = '  ',
    highlight = 'GalaxyMidFileStatusRestricted',
    separator_highlight = 'GalaxyMapperCommon3',
  }
}
gls.left[9] = {
  DiagnosticWarn = {
    provider = 'DiagnosticWarn',
    icon = '  ',
    highlight = 'GalaxyMidFileStatusReadonly'
  }
}

gls.left[10] = {
  DiagnosticHint = {
    provider = 'DiagnosticHint',
    icon = '  ',
    highlight = 'GalaxyMapperCommon2'
  }
}

gls.left[11] = {
  DiagnosticInfo = {
    provider = 'DiagnosticInfo',
    icon = '  ',
    highlight = 'GalaxyMapperCommon3'
  }
}

gls.mid[1] = {
  ShowLspClient = {
    provider = 'GetLspClient',
    condition = function ()
      local tbl = {['dashboard'] = true,['']=true}
      if tbl[vim.bo.filetype] then
        return false
      end
      return true
    end,
    icon = ' LSP: ',
    highlight = 'GalaxyMapperCommon8',
  }
}

gls.right[1] = {
  FileEncode = {
    provider = 'FileEncode',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = 'GalaxyMidFileStatusUnmodified',
    highlight = 'GalaxyMidFileStatusUnmodified',
  }
}

gls.right[2] = {
  FileFormat = {
    provider = 'FileFormat',
    condition = condition.hide_in_width,
    separator = ' ',
    separator_highlight = 'GalaxyMidFileStatusUnmodified',
    highlight = 'GalaxyMidFileStatusUnmodified',
  }
}
gls.right[3] = {
    Filler = {
        provider = function() return ' ' end,
        highlight = 'GalaxyMidFileStatusUnmodified',
        separator_highlight = 'GalaxyMidFileStatusUnmodified',
    }
}

gls.right[4] = {
  GitIcon = {
    provider = function() return ' ' end,
    condition = condition.check_git_workspace,
    separator = ' ',
    separator_highlight = 'GalaxyLeftGitDiffAddActive',
    highlight = 'GalaxyLeftGitDiffAddActive',
  }
}

gls.right[5] = {
  GitBranch = {
    provider = 'GitBranch',
    condition = condition.check_git_workspace,
    highlight = 'GalaxyLeftGitDiffAddActive',
  }
}

gls.right[6] = {
  DiffAdd = {
    provider = 'DiffAdd',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = 'GalaxyLeftGitDiffAddActive',
  }
}
gls.right[7] = {
  DiffModified = {
    provider = 'DiffModified',
    condition = condition.hide_in_width,
    icon = ' 柳',
    highlight = 'GalaxyLeftGitDiffModifiedActive',
  }
}
gls.right[8] = {
  DiffRemove = {
    provider = 'DiffRemove',
    condition = condition.hide_in_width,
    icon = '  ',
    highlight = 'GalaxyLeftGitDiffRemoveActive',
  }
}

gls.right[9] = {
  RainbowBlue = {
    provider = function() return ' ' end,
    highlight = 'GalaxyLeftGitDiffAddActive',
  },
}

gls.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {}
  }
}

gls.short_line_left[2] = {
  SFileName = {
    provider =  'SFileName',
    condition = condition.buffer_not_empty,
  }
}

gls.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
  }
}
