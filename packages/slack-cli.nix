{ stdenvNoCC, fetchurl }:

stdenvNoCC.mkDerivation rec {
  pname = "slack-cli";
  version = "4.11.0";

  src = fetchurl {
    url = "https://github.com/slackapi/slack-cli/releases/download/v${version}/slack_cli_${version}_macOS_arm64.tar.gz";
    sha256 = "d66049692424b1e91014df792b38000709c5361429e3f17f53e64720d8aeabbc";
  };

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
    platforms = [ "aarch64-darwin" ];
    mainProgram = "slack";
  };
}
