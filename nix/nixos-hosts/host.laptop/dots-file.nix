{pkgs, ...}: {
  users.groups.dots = {
    # gid = 1001;
  };
  systemd.tmpfiles.rules = [
    "d /dots 0774 root dots -"
  ];
}
