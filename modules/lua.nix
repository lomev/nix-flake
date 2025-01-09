{ buildLuarocksPackage, dkjson, fetchFromGitHub, fetchurl, luaOlder }:
buildLuarocksPackage {
  pname = "lain";
  version = "scm-1";
  knownRockspec = (fetchurl {
    url    = "mirror://luarocks/lain-scm-1.rockspec";
    sha256 = "0pkmbjzfcizl9vkpag5wq7qvm7jv8r2q1z8gdbw47hn9w2qg9cdf";
  }).outPath;
  src = fetchFromGitHub {
    owner = "lcpz";
    repo = "lain";
    rev = "88f5a8abd2649b348ffec433a24a263b37f122c0";
    hash = "sha256-MH/aiYfcO3lrcuNbnIu4QHqPq25LwzTprOhEJUJBJ7I=";
  };

  disabled = luaOlder "5.3";
  propagatedBuildInputs = [ dkjson ];

  meta = {
    homepage = "https://github.com/lcpz/lain";
    description = "Layout, widgets and utilities for Awesome WM";
    license.fullName = "GPL2";
  };
}
