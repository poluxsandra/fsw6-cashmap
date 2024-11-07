import type { Metadata } from "next";

export const metadata: Metadata = {
  title: "",
  description: "",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="">
      <body
        className={`antialiased`}
      >
        {children}
      </body>
    </html>
  );
}
