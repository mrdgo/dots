local dap =  require'dap'

local gps_dir = '/home/maxim/dokumente/isento/gps/'
local gps = gps_dir..'python/gps/gps_main.py'

local py_path = function()
    return gps_dir .. 'venv_gps/bin/python'
end

dap.configurations.python = {
    {
        type = 'python';
        request = 'launch';
        name = 'Create lea images';
        program = gps;
        args = {'pigps_pigps_lea_test', '-m', 'create_data'};
        pythonPath = py_path
    },
    {
        type = 'python';
        request = 'launch';
        name = 'Pretrain lea policy';
        program = gps;
        args = {'pigps_pigps_lea_test', '-m', 'pretrain'};
        pythonPath = py_path
    },
    {
        type = 'python';
        request = 'launch';
        name = 'Regular lea run';
        program = gps;
        --args = {'pigps_pigps_lea_test', '-m', 'train', '-v'};
        args = {'pigps_pigps_lea_test', '-m', 'train', '--dont_save_samples', '-v'};
        console = dap.integratedTerminal;
        pythonPath = py_path
    },
    {
        type = 'python';
        request = 'launch';
        name = 'Lea grid search';
        program = gps;
        args = {'pigps_pigps_lea_test', '-m', 'grid_search', '-g', 'eval_grid.json', '--dont_save_samples'};
        pythonPath = py_path
    },
    {
        type = 'python';
        request = 'launch';
        name = 'Create cartpole images';
        program = gps;
        args = {'pigps_pigps_cartpole_test', '-m', 'create_data'};
        pythonPath = py_path
    },
    {
        type = 'python';
        request = 'launch';
        name = 'Pretrain cartpole policy';
        program = gps;
        args = {'pigps_pigps_cartpole_test', '-m', 'pretrain'};
        pythonPath = py_path
    },
    {
        type = 'python';
        request = 'launch';
        name = 'Regular cartpole run';
        program = gps;
        args = {'pigps_pigps_cartpole_test', '-m', 'train', '--dont_save_samples'};
        console = dap.integratedTerminal;
        pythonPath = py_path
    },
    {
        type = 'python';
        request = 'launch';
        name = 'PyBullet test script';
        program = gps_dir..'python/tests/pybullet_test.py';
        args = {};
        pythonPath = py_path
    },
    {
        type = 'python';
        request = 'launch';
        name = 'Google tutorial';
        program = '/home/maxim/dokumente/isento/tf/cnn/gtut.py';
        args = {'gtut.py'};
        pythonPath = py_path
    }
}

dap.adapters.python = {
  type = 'executable';
  command = gps_dir..'/venv_gps/bin/python';
  args = { '-m', 'debugpy.adapter' };
}
