{ pkgs, ... }:
{
  systemd.services.zapret = {
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "multi-user.target" ];

    path = with pkgs; [
      iptables
      nftables
      gawk
    ];

    serviceConfig = {
      Type = "forking";
      Restart = "no";
      TimeoutSec = "30sec";
      IgnoreSIGPIPE = "no";
      KillMode = "none";
      GuessMainPID = "no";
      ExecStart = "${pkgs.zapret}/bin/zapret start";
      ExecStop = "${pkgs.zapret}/bin/zapret stop";

      EnvironmentFile = pkgs.writeText "zapret-environment" ''
        SET_MAXELEM=522288

        IPSET_OPT="hashsize 262144 maxelem $SET_MAXELEM"

        IP2NET_OPT4="--prefix-length=22-30 --v4-threshold=3/4"
        IP2NET_OPT6="--prefix-length=56-64 --v6-threshold=5"

        AUTOHOSTLIST_RETRANS_THRESHOLD=3
        AUTOHOSTLIST_FAIL_THRESHOLD=3
        AUTOHOSTLIST_FAIL_TIME=60

        AUTOHOSTLIST_DEBUGLOG=0

        MDIG_THREADS=30

        GZIP_LISTS=1

        DESYNC_MARK=0x40000000
        DESYNC_MARK_POSTNAT=0x20000000

        NFQWS_ENABLE=1
        NFQWS_PORTS_TCP=80,443
        NFQWS_PORTS_UDP=443,50000-65535

        NFQWS_TCP_PKT_OUT=$((6+$AUTOHOSTLIST_RETRANS_THRESHOLD))
        NFQWS_TCP_PKT_IN=3
        NFQWS_UDP_PKT_OUT=$((6+$AUTOHOSTLIST_RETRANS_THRESHOLD))
        NFQWS_UDP_PKT_IN=0

        # NFQWS_OPT="
        # --filter-udp=443 --hostlist=${./zapret/list-general.txt} --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic=${./zapret/quic_initial_www_google_com.bin} --new
        # --filter-udp=50000-50100 --filter-l7=discord,stun --dpi-desync=fake --dpi-desync-repeats=6 --new
        # --filter-tcp=80 --hostlist=${./zapret/list-general.txt} --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new
        # --filter-tcp=443 --hostlist=${./zapret/list-general.txt} --dpi-desync=fake --dpi-desync-fooling=md5sig --dpi-desync-fake-tls-mod=rnd,rndsni,padencap --new
        # --filter-udp=443 --ipset=${./zapret/ipset-all.txt} --dpi-desync=fake --dpi-desync-repeats=6 --dpi-desync-fake-quic=${./zapret/quic_initial_www_google_com.bin} --new
        # --filter-tcp=80 --ipset=${./zapret/ipset-all.txt} --dpi-desync=fake,split2 --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new
        # --filter-tcp=443,1024-65535 --ipset=${./zapret/ipset-all.txt} --dpi-desync=fake --dpi-desync-fooling=md5sig --dpi-desync-fake-tls-mod=rnd,rndsni,padencap --new
        # --filter-udp=1024-65535 --ipset=${./zapret/ipset-all.txt} --dpi-desync=fake --dpi-desync-autottl=2 --dpi-desync-repeats=10 --dpi-desync-any-protocol=1 --dpi-desync-fake-unknown-udp=${./zapret/quic_initial_www_google_com.bin} --dpi-desync-cutoff=n2
        # "

        NFQWS_OPT="
        --filter-udp=443 --hostlist=${./zapret/list-general.txt} --dpi-desync=fake --dpi-desync-repeats=11 --dpi-desync-fake-quic=${./zapret/quic_initial_www_google_com.bin} --new
        --filter-udp=50000-50100 --filter-l7=discord,stun --dpi-desync=fake --dpi-desync-repeats=6 --new
        --filter-tcp=80 --hostlist=${./zapret/list-general.txt} --dpi-desync=fake,fakedsplit --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new
        --filter-tcp=443 --hostlist=${./zapret/list-general.txt} --dpi-desync=fake,multidisorder --dpi-desync-split-pos=1,midsld --dpi-desync-repeats=11 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls-mod=rnd,dupsid,sni=www.google.com --new
        --filter-udp=443 --ipset=${./zapret/ipset-all.txt} --dpi-desync=fake --dpi-desync-repeats=11 --dpi-desync-fake-quic=${./zapret/quic_initial_www_google_com.bin} --new
        --filter-tcp=80 --ipset=${./zapret/ipset-all.txt} --dpi-desync=fake,fakedsplit --dpi-desync-autottl=2 --dpi-desync-fooling=md5sig --new
        --filter-tcp=443,1024-65535 --ipset=${./zapret/ipset-all.txt} --dpi-desync=fake,multidisorder --dpi-desync-split-pos=1,midsld --dpi-desync-repeats=11 --dpi-desync-fooling=md5sig --dpi-desync-fake-tls-mod=rnd,dupsid,sni=www.google.com --new
        --filter-udp=1024-65535 --ipset=${./zapret/ipset-all.txt} --dpi-desync=fake --dpi-desync-autottl=2 --dpi-desync-repeats=10 --dpi-desync-any-protocol=1 --dpi-desync-fake-unknown-udp=${./zapret/quic_initial_www_google_com.bin} --dpi-desync-cutoff=n2
        "

        # Method1
        #NFQWS_OPT="
        #--filter-tcp=80,443 --dpi-desync=disorder2 --dpi-desync-ttl=12 --new
        #--filter-udp=443,50000-65535 --dpi-desync=fake,tamper --dpi-desync-any-protocol --dpi-desync-repeats=19
        #"

        # Method2
        # NFQWS_OPT="
        # --filter-tcp=80,443 --methodeol --new
        # --filter-udp=443,50000-65535 --dpi-desync=fake,tamper --dpi-desync-any-protocol --dpi-desync-repeats=19
        # "

        # Only UDP
        #NFQWS_OPT="
        #--filter-udp=443,50000-65535 --dpi-desync=fake,tamper --dpi-desync-any-protocol --dpi-desync-repeats=19
        #"

        # none,ipset,hostlist,autohostlist
        MODE_FILTER=none

        FLOWOFFLOAD=donttouch

        INIT_APPLY_FW=1

        DISABLE_IPV6=1
      '';
    };
  };
}
