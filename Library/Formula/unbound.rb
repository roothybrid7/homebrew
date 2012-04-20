require 'formula'

class Unbound < Formula
  homepage 'http://www.unbound.net'
  url 'http://www.unbound.net/downloads/unbound-1.4.16.tar.gz'
  sha256 'fb71665851eb11d3b1ad5dd5f9d7b167e0902628c06db3d6fc14afd95cc970fa'

  def options
  [
    ["--with-libevent", "Build with libevent support."]
  ]
  end

  depends_on 'ldns'
  depends_on 'libevent' if ARGV.include? '--with-libevent'

  def install
    args = [
      "--disable-gost",
      "--prefix=#{prefix}"
    ]

    if ARGV.include? "--with-libevent"
      args << "--with-libevent=#{HOMEBREW_PREFIX}"
    end

    system "./configure", *args
    system "make install"
  end
end
