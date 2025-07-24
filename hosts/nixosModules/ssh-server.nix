{ ... }:
{
  services.openssh = {
    enable = true;
    settings.AuthenticationMethods = "publickey,password";
    banner = ''
_______                                                 ___ ___                       .____          ___.    
\   _  \____________    ____    ____   ____            /   |   \  ____   _____   ____ |    |   _____ \_ |__  
/  /_\  \_  __ \__  \  /    \  / ___\_/ __ \   ______ /    ~    \/  _ \ /     \_/ __ \|    |   \__  \ | __ \ 
\  \_/   \  | \// __ \|   |  \/ /_/  >  ___/  /_____/ \    Y    (  <_> )  Y Y  \  ___/|    |___ / __ \| \_\ \
 \_____  /__|  (____  /___|  /\___  / \___  >          \___|_  / \____/|__|_|  /\___  >_______ (____  /___  /
       \/           \/     \//_____/      \/                 \/              \/     \/        \/    \/    \/



'';
  };
  users.users.dani.openssh.authorizedKeys.keys = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJEE/75WcJFpPJpvzXHhKrNqepUG+pkJG5aYnsOnqK4p" # g15
  ];
}
