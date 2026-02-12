{ config, ... }: {
  environment.persistence."/persistence".files = [ "/etc/aliases" ];

  programs.msmtp = {
    enable = true;
    setSendmail = true;
    defaults = {
      aliases = "/etc/aliases";
      port = 465;
      auth = "login";
      tls_trust_file = "/etc/ssl/certs/ca-certificates.crt";
      tls = "on";
      tls_starttls = "off";
    };
    accounts = {
      default = {
        host = "smtp.gmail.com";
        passwordeval = "cat ${config.sops.secrets.email_pass.path}";
        user = "furkasz42@gmail.com";
        from = "furkasz42@gmail.com";
      };
    };
  };
}
