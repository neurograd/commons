function result = cajalmenu()


quadrantGrating = struct(...
    'prompt', 'Shan''s quadrant grating (960 s)', ...
    'logger', stims.core.Logger(psy.Session, psy.Condition, psy.Trial, psy.Grating), ...
    'constants', struct(...
    'stimulus', 'grating', ... % stimulus name recorded in the session table
    'monitor_distance', 10, ...  (cm)
    'monitor_size', 7, ...       (inches) diagonal
    'monitor_aspect', 1.7, ...   (physical aspect ratio W/H)
    'resolution_x', 1024, ...     (pixels)
    'resolution_y',  600 ...      (pixels)
    ), ...
    'blocks', 8, ...
    'stim', {{
    setParams(stims.Grating, ...
    'pre_blank', 3, ...
    'trial_duration', 2, ...
    'direction', [90, 180], ...
    'aperture_radius', 0.15, ...
    'aperture_x', [-0.4,0.2], ...
    'aperture_y', [-0.36,0.32], ...
    'temp_freq', 4,...
    'spatial_freq',0.08)...    
    }});

flashingBar = struct(...
    'prompt', 'flashing bar (3 min)', ...
    'logger', stims.core.Logger(psy.Session, psy.Condition, psy.Trial, psy.FlashingBar), ...
    'constants', ...
    struct(...
    'stimulus', 'flashing bar', ...  % stimulus name recorded in the session table
    'monitor_distance', 10, ... (cm)
    'monitor_size', 7, ...      (inches) diagonal
    'monitor_aspect', 1.7, ...  (physical aspect ratio W/H)
    'resolution_x', 1024, ...   (pixels)
    'resolution_y',  600 ...    (pixels)
    ), ...
    'blocks', 2, ...
    'stim', {{
    setParams(stims.FlashingBar,...
    'pre_blank', 1.0, ...   (s) blank period preceding trials
    'luminance', 30, ...    cd/m^2 mid-value luminance"
    'contrast', 0.99, ...  Michelson contrast
    'bg_color', 127, ...   0-254
    'orientation', [45 135], ... (degrees) 0=north, 90=east
    'bg_color', 127, ...   0-254
    'offset', -linspace(-0.7,0.7,30), ... normalized by half-diagonal
    'width', 0.02,  ... normalized by half-diagonal
    'trial_duration', 0.5, ... (s) ON time of flashing bar
    'pattern_frequency', 20 ... (Hz) will be rounded to nearest fraction of fps
    )
    }});

movingNoise = struct(...
    'prompt', 'Monet (30 min)', ...
    'logger', stims.core.Logger(psy.Session, psy.Condition, psy.Trial, psy.MovingNoise), ...
    'constants', ...
    struct(...
    'stimulus', 'movingNoise', ...  % stimulus name recorded in the session table
    'monitor_distance', 7, ... (cm)
    'monitor_size', 7, ...      (inches) diagonal
    'monitor_aspect', 1.7, ...  (physical aspect ratio W/H)
    'resolution_x', 1024, ...   (pixels)
    'resolution_y',  600 ...    (pixels)
    ), ...
    'blocks', 1, ... % 100 for imaging @38000 frames
    'stim', {{
    setParams(stims.MovingNoise, ...
    'rng_seed',    1:60,         ... RNG seed 1:60
    'luminance',   10,           ... cd/m^2
    'contrast',    0.95,        ... Michelson's 0-1
    'tex_ydim',    76,          ... (pixels) texture dimension
    'tex_xdim',    128,          ... (pixels) texture dimension
    'spatial_freq_half', 0.04,  ... (cy/deg) spatial frequency modulated to 50 - deprecated in version 3
    'spatial_freq_stop',0.2,    ... (cy/deg), spatial lowpass cutoff
    'temp_bandwidth',4,        ... (Hz) temporal bandwidth
    'frame_downsample', 1,      ... 1=60 fps, 2=30 fps, 3=20 fps, 4=15 fps, etc
    'n_dirs', 16, ...  number of directions of motion
    'ori_bands', 2, ...  orientation width expressed in units of 2*pi/n_dirs.  Must be integer
    'ori_modulation', 1.0, ...  mix-in proportion of oriented noise
    'ori_on_secs', 0.875, ...  seconds of movement and orientation bias
    'ori_off_secs', 1, ...  second with no movement or orientation bias
    'speed', 25 ...  degrees per second
    )
    }});

vanGogh = struct(...
    'prompt', 'Van Gogh (30 min)', ...
    'logger', stims.core.Logger(psy.Session, psy.Condition, psy.Trial, psy.VanGogh), ...
    'constants', ...
    struct(...
    'stimulus', 'vangogh', ...  % stimulus name recorded in the session table
    'monitor_distance', 7, ... (cm)
    'monitor_size', 7, ...      (inches) diagonal
    'monitor_aspect', 1.7, ...  (physical aspect ratio W/H)
    'resolution_x', 1024, ...   (pixels)
    'resolution_y',  600 ...    (pixels)
    ), ...
    'blocks', 1, ...
    'stim', {{
    setParams(stims.VanGogh, ...
    'rng_seed',    1:60,         ... RNG seed 1:150
    'frame_downsample', 1,      ... 1=60 fps, 2=30 fps, 3=20 fps, 4=15 fps, etc
    'luminance',   10,           ... cd/m^2
    'contrast',    0.95,        ... Michelson's 0-1
    'duration', 30,            ... (seconds)
    'tex_ydim', 76,           ... (pixels) texture dimension
    'tex_xdim', 128,           ... (pixels) texture dimension
    'spatial_freq_half', 0.04, ... (cy/deg) spatial frequency modulated to 50 - deprecated in version 3
    'spatial_freq_stop', 0.3,  ... (cy/deg), spatial lowpass cutoff
    'temp_bandwidth', 4,       ... (Hz) temporal bandwidth
    'ori_bandwidth', pi / 20,  ... (rad) bandwidth of orientation filter
    'ori_map_spatial_bandwidth', 0.05,  ... (cy/deg) spatial bandwidth for ori map
    'ori_map_temp_bandwidth', 1,        ... (Hz) temporal bandwidth for ori map
    'contrast_spatial_bandwidth', 0.03, ... (cy/deg) spatial bandwidth of contrast map
    'contrast_temp_bandwidth', 1,       ... (Hz) temporal bandwidth of contrast map
    'contrast_exponent', 1/3            ... exponent of power function for contrast map
    )
    }});



trippy = struct(...
    'prompt', 'Trippy (30 mins)', ...
    'logger', stims.core.Logger(psy.Session, psy.Condition, psy.Trial, psy.Trippy), ...
    'constants', ...
    struct(...
    'stimulus', 'trippy', ...  % stimulus name recorded in the session table
    'monitor_distance', 7, ... (cm)
    'monitor_size', 7, ...      (inches) diagonal
    'monitor_aspect', 1.7, ...  (physical aspect ratio W/H)
    'resolution_x', 1024, ...   (pixels)
    'resolution_y',  600 ...    (pixels)
    ), ...
    'blocks', 1, ...
    'stim', {{
    setParams(stims.Trippy, ...
    'rng_seed',    1:30,         ... RNG seed 1:150
    'frame_downsample', 1,      ... 1=60 fps, 2=30 fps, 3=20 fps, 4=15 fps, etc
    'luminance',   10,           ... cd/m^2
    'contrast',    0.95,        ... Michelson's 0-1
    'duration', 60,            ... (seconds)
    'tex_ydim', 150,           ... (pixels) texture dimension
    'tex_xdim', 256,           ... (pixels) texture dimension
    'xnodes', 12, ...     % x dimension of low-res phase movie
    'ynodes', 8, ...      % y dimension of low-res phase movie
    'up_factor', 24, ...  % upscale factor from low-res to texture dimensions
    'temp_freq', 4, ...   % (Hz) temporal frequency if the phase pattern were static
    'temp_kernel_length', 61, ...  % length of Hanning kernel used for temporal filter. Controls the rate of change of the phase pattern.
    'spatial_freq', 0.20 ...  % (cy/degree) approximate max. Actual frequency spectrum ranges propoprtionally.
    )}});


result = [
     quadrantGrating
     flashingBar
     movingNoise
     vanGogh
     trippy
    ];
