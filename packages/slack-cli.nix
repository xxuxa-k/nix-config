{ stdenvNoCC, fetchurl }:

let
  version = "4.11.0";
  sources = {
    aarch64-darwin = {
      url = "https://github.com/slackapi/slack-cli/releases/download/v${version}/slack_cli_${version}_macOS_arm64.tar.gz";
      sha256 = "d66049692424b1e91014df792b38000709c5361429e3f17f53e64720d8aeabbc";
    };

    x86_64-linux = {
      url = "https://github.com/slackapi/slack-cli/releases/download/v${version}/slack_cli_${version}_linux_64-bit.tar.gz";
      hash = "faebd25d8d27513b95aaabbfda3b73f80c7059c01a53bde65dcf2e9ba6f89afb";
    };
  };
in
  stdenvNoCC.mkDerivation {
    pname = "slack-cli";
    inherit version;

    src = fetchurl sources.${stdenvNoCC.hostPlatform.system};

    sourceRoot = ".";
    dontBuild = true;
    dontStrip = true;

    installPhase = ''
    runHook preInstall

    install -Dm755 bin/slack "$out/bin/slack"

    runHook postInstall
    '';

    meta = {
      description = "CLI for developing Slack apps";
      homepage = "https://github.com/slackapi/slack-cli";
      platforms = builtins.attrNames sources;
      mainProgram = "slack";
    };
  }
