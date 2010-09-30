unit numero;

interface

uses
  Classes;

  type

TNumeroEnPalabras = class
private
  function _numero(numero : Int64) : String;
  function NumeroEnPalabrasList(numero : Int64) : TStringList;
  function Millardo(numero: Int64; period: Int64): String;
  function join(lst: TStringList; sep: string = ' ') : string;
  function RightStr(Const Str: String; Size: Word): String;
public
  function NumeroEnPalabras(numero : Int64) : String;
end;

implementation

uses
  SysUtils, Math;

const
  Ones: array[0..29] of string = ('cero', 'uno', 'dos', 'tres', 'cuatro',
    'cinco', 'seis', 'siete', 'ocho', 'nueve', 'diez', 'once', 'doce', 'trece',
    'catorce', 'quince', 'dieciséis', 'diecisiete', 'dieciocho', 'diecinueve',
    'veinte', 'veintiuno', 'veintidós', 'veintitrés', 'veinticuatro',
    'veinticinco', 'veintiséis', 'veintisiete', 'veintiocho', 'veintinueve');
  Tens: array[0..9] of string = ('', 'diez', 'veinte', 'treinta', 'cuarenta',
    'cincuenta', 'sesenta', 'setenta', 'ochenta', 'noventa');
  Huns: array[0..9] of string = ('', 'cien', 'doscientos', 'trescientos',
    'cuatrocientos', 'quinientos', 'seiscientos', 'setecientos', 'ochocientos',
    'novecientos');
  Periodos: array[0..7] of string = ('', 'mil', 'mill', 'mil mill', 'bill',
    'trill', 'cuatrill', 'quintill');

{ TNumeroEnPalabras }

function TNumeroEnPalabras.join(lst: TStringList; sep: string): string;
var
  i : Integer;
begin
  Result := '';
  for i := 0 to lst.Count - 1 do
  begin
    if (Result <> '') and (Result[Length(result)] <> sep) then
      Result := Result + sep;
    Result := Result + lst[i];
  end;
  Result := Trim(Result);
end;

function TNumeroEnPalabras.Millardo(numero: Int64; period: Int64): String;
var
  i : Integer;
  n : Int64;
  str : String;
begin
  str := IntToStr(numero);
  i := (Length(str) div 3) - 1;
  if Length(str) mod 3 > 0 then
    Inc(i);
  Result := Periodos[i];
  // Casos plural:
  // mil, un millón, mil millones, un billón, mil billones, un trillón...
  if i > 1 then
  begin
    if i mod 2 = 0 then
    begin
      n := numero div period;
      if n = 1 then
        Result := Result + 'ón' // singular
      else
        Result := Result + 'ones';
    end
    else
      Result := Result + 'ones'; // plural para mil millones, mil billones, etc.
  end;

end;

function TNumeroEnPalabras.NumeroEnPalabras(numero: Int64): String;
var
  nlist, res : TStringList;
  i : Integer;
  neg : boolean;
  period, part : Int64;
begin
  neg := (numero < 0);
  numero := abs(numero);
  nlist := NumeroEnPalabrasList(numero);
  res := TStringList.Create;
  for i := 0 to nlist.Count - 1 do
  begin
    res.Append(nlist[i]);
    period := Trunc(IntPower(10, (nlist.Count - i - 1) * 3));
    part := (numero div period) * period;
    res.Append(Millardo(part, period));
    numero := numero - part;
  end;

  Result := join(res);
  if neg then
    Result := 'menos ' + Result;
  FreeAndNil(res);
  FreeAndNil(nlist);
end;

function TNumeroEnPalabras.NumeroEnPalabrasList(numero: Int64): TStringList;
var
  res : TStringList;
  tmp : Int64;
  sep : String;
  str : String;
begin
  res := TStringList.Create;
  sep := '';
  if numero = 0 then
    res.Add('cero')
  else if numero = 1 then
    res.Add('uno')
  else
  begin
    while numero > 0 do
    begin
      tmp := numero mod 1000;
      // Casos: 'un trillón' - 'mil billones' - 'un billón', 'mil millones', 'un millón', 'mil' -
      // 0 - 'uno', Par - 'un' - impar - 'none'
      if (tmp = 1) and (res.Count > 0) then
      begin
        if res.Count mod 2 = 1 then
          res.Insert(0, '')
        else
          res.Insert(0, 'un');
      end else if tmp = 0 then
      begin
        res.Insert(0, '');
      end
      else
      begin
        str := _numero(tmp);
        // Excepciones desde miles en adelante
        if res.Count > 0 then
        begin
          // RAE: 'veintiún mil', no 'veintiuno mil'
          if (tmp = 21) then
          begin
              str := 'veintiún';
          end
          else
          begin
            if RightStr(str, 3) = 'uno' then
              // Eliminamos la última 'o' para que sea 'y un'
              str := Copy(str, 0, Length(str) - 1);
          end;
        end;
        res.Insert(0, str)
      end;
      numero := numero div 1000;
    end;
  end;
  Result := res;
end;

function TNumeroEnPalabras.RightStr(const Str: String; Size: Word): String;
begin
  if Size > Length(Str) then Size := Length(Str) ;
  RightStr := Copy(Str, Length(Str) - Size + 1, Size)
end;

{ internal }
function TNumeroEnPalabras._numero(numero: Int64): String;
var
  res : TStringList;
  tmp : Int64;
  sep : String;
begin
  assert(numero < 1000);
  res := TStringList.Create;
  sep := '';
  if numero < 30 then
    res.Add(Ones[numero])
  else
  begin
    sep := '';
    tmp := numero div 100;
    if tmp > 0 then
    begin
      // excepción
      if (res.Count = 0) and (tmp = 1) and (numero mod 100 <> 0) then
        res.Add('ciento')
      else
        res.Add(Huns[tmp]);
    end;
    tmp := numero mod 100;
    if tmp > 0 then
    begin
      if tmp < 30 then
        res.Add(Ones[tmp])
      else
      begin
        tmp := (numero - (numero div 100) * 100) div 10;
        if tmp > 0 then
        begin
          res.Add(Tens[tmp]);
          sep := 'y';
        end;
        tmp := numero mod 10;
        if tmp > 0 then
        begin
          if sep <> '' then
            res.Add(sep);
          res.Add(Ones[tmp]);
        end;
      end;
    end;
  end;

  Result := join(res);
  FreeAndNil(res);
end;

end.
