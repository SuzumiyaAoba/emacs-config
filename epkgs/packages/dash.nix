{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "dash";
  version = "2.19.1";
  src = sources.dash.src;
}
