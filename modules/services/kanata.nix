{ pkgs, ... }:
{
  environment.systemPackages = [ pkgs.kanata ];
  services.kanata = {
    enable = true;
    keyboards = {
      default = {
        config = ''

          (defsrc
            esc  f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12
            grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
            caps a    s    d    f    g    h    j    k    l    ;    '    ret
            lsft z    x    c    v    b    n    m    ,    .    /    rsft
            lctl lmet lalt           spc            ralt rmet rctl
          )

          (defalias sym (tap-hold 200 200 esc (layer-toggle symbols)))
          (deflayer default
            esc  f1   f2   f3   f4   f5   f6   f7   f8   f9   f10  f11  f12
            grv  1    2    3    4    5    6    7    8    9    0    -    =    bspc
            tab  q    w    e    r    t    y    u    i    o    p    [    ]    \
            @sym a    s    d    f    g    h    j    k    l    ;    '    ret
            lsft z    x    c    v    b    n    m    ,    .    /    rsft
            lctl lmet lalt           spc            ralt rmet rctl
          )

          (deflayer symbols
            _    _    _    _    _    _     _    _    _    _    _    _    _
            _    _    _    _    _    _     _    _    _    _    _    _    _    _
            _    f6   _    _    _    _     _    _    _    _    up   _    _    _
            _    _    _    _    _    _     left down up   rght _    _    _
            _    _    _    _    _    bspc  down _    _    _    _    _
            _    _    _              _               _    _    _
          )
        '';
      };
    };
  };
}
