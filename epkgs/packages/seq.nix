{ sources, epkgs }:
epkgs.melpaBuild {
  pname = "seq";
  version = "2.24";
  src = sources.seq.src;
}
