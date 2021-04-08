local dap =  require'dap'

local gps_dir = '/home/maxim/dokumente/isento/gps/'
local gps = gps_dir..'python/gps/gps_main.py'

dap.configurations.python = {
    {
        type = 'python';
        request = 'launch';
        name = 'Create lea images';
        program = gps;
        args = {'pigps_pigps_lea_test', '-m', 'create_data', '-n', '4'};
        pythonPath = function()
            return gps_dir..'venv_gps/bin/python'
        end;
    },
    {
        type = 'python';
        request = 'launch';
        name = 'Pretrain lea policy';
        program = gps;
        args = {'pigps_pigps_lea_test', '-m', 'pretrain'};
        pythonPath = function()
            return gps_dir..'venv_gps/bin/python'
        end;
    },
    {
        type = 'python';
        request = 'launch';
        name = 'Regular lea run';
        program = gps;
        args = {'pigps_pigps_lea_test', '-m', 'train'};
        console = dap.integratedTerminal;
        pythonPath = function()
            return gps_dir..'venv_gps/bin/python'
        end;
    },
    {
        type = 'python';
        request = 'launch';
        name = 'Lea grid search';
        program = gps;
        args = {'pigps_pigps_lea_test', '-m', 'grid_search', '-g', 'eval_grid.json'};
        pythonPath = function()
            return gps_dir..'venv_gps/bin/python'
        end;
    },
    {
        type = 'python';
        request = 'launch';
        name = 'Create cartpole images';
        program = gps;
        args = {'pigps_pigps_cartpole_test', '-m', 'create_data', '-n', '4'};
        pythonPath = function()
            return gps_dir..'venv_gps/bin/python'
        end;
    },
    {
        type = 'python';
        request = 'launch';
        name = 'Pretrain cartpole policy';
        program = gps;
        args = {'pigps_pigps_cartpole_test', '-m', 'pretrain'};
        pythonPath = function()
            return gps_dir..'venv_gps/bin/python'
        end;
    },
    {
        type = 'python';
        request = 'launch';
        name = 'Regular cartpole run';
        program = gps;
        args = {'pigps_pigps_cartpole_test', '-m', 'train'};
        console = dap.integratedTerminal;
        pythonPath = function()
            return gps_dir..'venv_gps/bin/python'
        end;
    },
    {
        type = 'python';
        request = 'launch';
        name = 'PyBullet test script';
        program = gps_dir..'python/tests/pybullet_test.py';
        args = {};
        pythonPath = function()
            return gps_dir..'venv_gps/bin/python'
        end;
    },
    {
        type = 'python';
        request = 'launch';
        name = 'Google tutorial';
        program = '/home/maxim/dokumente/isento/tf/cnn/gtut.py';
        args = {'gtut.py'};
        pythonPath = function()
            return '/home/maxim/dokumente/isento/tf/venv-tf/bin/python'
        end;
    }
}

dap.adapters.python = {
  type = 'executable';
  command = gps_dir..'/venv_gps/bin/python';
  args = { '-m', 'debugpy.adapter' };
}
