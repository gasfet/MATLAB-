function this = cStruct(varargin)
parent = builtin('struct', varargin{:});
this_struct = builtin('struct', []);
this = class(this_struct, 'cStruct', parent);