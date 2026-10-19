program KasirTokoMini;
// Proyek UTS: Kasir Toko Mini
// Mencakup: I/O, if-else bersarang, case-of, for-to-do, while-do, repeat-until, break & continue, menu interaktif 

uses sysutils;

const
  MaxBarang = 50;

var
  nama   : array[1..MaxBarang] of string[30];
  harga  : array[1..MaxBarang] of real;
  qty    : array[1..MaxBarang] of integer;
  jumlah : integer;
  pilih  : integer;

{ ---------- Hitung subtotal (for-to-do) ---------- }
function HitungSubtotal: real;
var
  i : integer;
  s : real;
begin
  s := 0;
  for i := 1 to jumlah do
    s := s + harga[i] * qty[i];
  HitungSubtotal := s;
end;

{ ---------- Diskon bertingkat (nested if-else) ---------- }
function PersenDiskon(total: real): integer;
begin
  if total >= 100000 then
  begin
    if total >= 250000 then
    begin
      if total >= 500000 then
        PersenDiskon := 15
      else
        PersenDiskon := 10;
    end
    else
      PersenDiskon := 5;
  end
  else
    PersenDiskon := 0;
end;

{ ---------- Menu 1: Input barang (while-do + break/continue) ---------- }
procedure InputBarang;
var
  nm : string;
  hg : real;
  q  : integer;
begin
  writeln;
  writeln('=== INPUT BARANG ===');
  writeln('Ketik "selesai" pada nama barang untuk berhenti.');
  while true do
  begin
    if jumlah >= MaxBarang then
    begin
      writeln('Keranjang penuh!');
      break;
    end;

    write('Nama barang  : ');
    readln(nm);
    if LowerCase(nm) = 'selesai' then
      break;                       { belanja selesai }

    write('Harga satuan : Rp ');
    readln(hg);
    write('Jumlah       : ');
    readln(q);

    if (hg <= 0) or (q <= 0) then
    begin
      writeln('>> Harga/jumlah tidak valid, ulangi input!');
      continue;                    { lewati, ulangi }
    end;

    jumlah := jumlah + 1;
    nama[jumlah]  := nm;
    harga[jumlah] := hg;
    qty[jumlah]   := q;
    writeln('>> ', nm, ' ditambahkan.');
  end;
end;

{ ---------- Menu 2: Tampilkan struk (for-to-do) ---------- }
procedure TampilStruk;
var
  i       : integer;
  sub, ds : real;
  pd      : integer;
begin
  writeln;
  if jumlah = 0 then
  begin
    writeln('Keranjang masih kosong.');
    exit;
  end;

  writeln('========== STRUK BELANJA ==========');
  writeln('No  Barang        Qty      Subtotal');
  writeln('-----------------------------------');
  for i := 1 to jumlah do
    writeln(i:2, '   ', nama[i]:-16  ,   qty[i]:4,  (harga[i] * qty[i]):12:0);
  writeln('-----------------------------------');

  sub := HitungSubtotal;
  pd  := PersenDiskon(sub);
  ds  := sub * pd / 100;

  writeln('Total belanja : Rp ', sub:0:0);
  writeln('Diskon (', pd, '%)  : Rp ', ds:0:0);
  writeln('Total bayar   : Rp ', (sub - ds):0:0);
  writeln('===================================');
end;

{ ---------- Menu 3: Pembayaran (while-do validasi) ---------- }
procedure Bayar;
var
  sub, tot, uang : real;
begin
  writeln;
  if jumlah = 0 then
  begin
    writeln('Belum ada barang untuk dibayar.');
    exit;
  end;

  sub := HitungSubtotal;
  tot := sub - (sub * PersenDiskon(sub) / 100);
  writeln('Total yang harus dibayar: Rp ', tot:0:0);

  uang := 0;
  while uang < tot do
  begin
    write('Uang diterima : Rp ');
    readln(uang);
    if uang < tot then
      writeln('>> Uang kurang Rp ', (tot - uang):0:0, ', masukkan lagi!');
  end;

  writeln('Kembalian     : Rp ', (uang - tot):0:0);
  writeln('Terima kasih sudah berbelanja!');
  jumlah := 0;                     { reset keranjang }
end;

{ ---------- Program utama (repeat-until + case-of) ---------- }
begin
  jumlah := 0;
  repeat
    writeln;
    writeln('===== KASIR TOKO MINI =====');
    writeln('1. Input Barang');
    writeln('2. Lihat Struk & Diskon');
    writeln('3. Bayar');
    writeln('4. Keluar');
    write('Pilih menu (1-4): ');
    readln(pilih);

    case pilih of
      1: InputBarang;
      2: TampilStruk;
      3: Bayar;
      4: writeln('Program selesai. Sampai jumpa!');
    else
      writeln('Menu tidak tersedia, pilih 1-4.');
    end;
  until pilih = 4;
end.
