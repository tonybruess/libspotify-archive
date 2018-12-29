class Libspotify < Formula
  desc "C interface to Spotify"
  homepage "https://github.com/tonybruess/libspotify-archive"
  url "https://github.com/tonybruess/libspotify-archive/raw/master/libspotify-12.1.51-Darwin-universal.zip"
  sha256 "80053f0779f6192a8052732904d88b91acc62a350831f6b585a3c6ac10cb8fbd"

  bottle :unneeded

  def install
    (include/"libspotify").install "libspotify.framework/Versions/12.1.51/Headers/api.h"
    lib.install "libspotify.framework/Versions/12.1.51/libspotify" => "libspotify.12.1.51.dylib"
    doc.install Dir["docs/*"]
    doc.install %w[licenses.xhtml examples]
    man3.install Dir["man3/*"]
    lib.install_symlink "libspotify.12.1.51.dylib" => "libspotify.dylib"
    lib.install_symlink "libspotify.12.1.51.dylib" => "libspotify.12.dylib"
    (lib/"pkgconfig/libspotify.pc").write pc_file
  end

  def pc_file; <<-EOS
    prefix=#{opt_prefix}
    exec_prefix=${prefix}
    libdir=${exec_prefix}/lib
    includedir=${prefix}/include
    Name: libspotify
    Description: Spotify client library
    Version: #{version}
    Libs: -L${libdir} -lspotify
    Cflags: -I${includedir}
    EOS
  end
end
