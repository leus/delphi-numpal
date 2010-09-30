unit Testnumero;
{
  Delphi DUnit Test Case
}

interface

uses
  TestFramework, numero;

type
  // Test methods for class TNumeroEnPalabras

  TestTNumeroEnPalabras = class(TTestCase)
  strict private
    FNumeroEnPalabras: TNumeroEnPalabras;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestCero;
    procedure TestNumeroEnPalabras;
    procedure TestNumeroEnPalabrasExt;
    procedure TestNegativos;
    procedure TestMayores;
    procedure TestMiles;
    procedure TestMillones;
    procedure TestBillones;
    procedure TestRAE;
  end;

implementation

procedure TestTNumeroEnPalabras.SetUp;
begin
  FNumeroEnPalabras := TNumeroEnPalabras.Create;
end;

procedure TestTNumeroEnPalabras.TearDown;
begin
  FNumeroEnPalabras.Free;
  FNumeroEnPalabras := nil;
end;

procedure TestTNumeroEnPalabras.TestBillones;
begin
  CheckEqualsString('un billón', FNumeroEnPalabras.NumeroEnPalabras(1000000000000));
  CheckEqualsString('diez billones', FNumeroEnPalabras.NumeroEnPalabras(10000000000000));
  CheckEqualsString('diez billones uno', FNumeroEnPalabras.NumeroEnPalabras(10000000000001));
  CheckEqualsString('diez billones mil', FNumeroEnPalabras.NumeroEnPalabras(10000000001000));

end;

procedure TestTNumeroEnPalabras.TestCero;
begin
  CheckEqualsString('cero', FNumeroEnPalabras.NumeroEnPalabras(0));
end;

procedure TestTNumeroEnPalabras.TestMayores;
begin
  CheckEqualsString('cien', FNumeroEnPalabras.NumeroEnPalabras(100));
  CheckEqualsString('ciento uno', FNumeroEnPalabras.NumeroEnPalabras(101));
  CheckEqualsString('ciento diez', FNumeroEnPalabras.NumeroEnPalabras(110));
  CheckEqualsString('ciento treinta', FNumeroEnPalabras.NumeroEnPalabras(130));
  CheckEqualsString('ciento treinta y uno', FNumeroEnPalabras.NumeroEnPalabras(131));
  CheckEqualsString('doscientos veintitrés', FNumeroEnPalabras.NumeroEnPalabras(223));
  CheckEqualsString('novecientos noventa y nueve', FNumeroEnPalabras.NumeroEnPalabras(999));
end;

procedure TestTNumeroEnPalabras.TestMiles;
begin
  CheckEqualsString('mil', FNumeroEnPalabras.NumeroEnPalabras(1000));
  CheckEqualsString('mil once', FNumeroEnPalabras.NumeroEnPalabras(1011));
  CheckEqualsString('dos mil', FNumeroEnPalabras.NumeroEnPalabras(2000));
  CheckEqualsString('ciento cuarenta y cuatro mil', FNumeroEnPalabras.NumeroEnPalabras(144000));

end;

procedure TestTNumeroEnPalabras.TestMillones;
begin
  CheckEqualsString('un millón', FNumeroEnPalabras.NumeroEnPalabras(1000000));
  // RAE: http://buscon.rae.es/dpdI/SrvltGUIBusDPD?origen=RAE&lema=cardinales
  CheckEqualsString('un millón uno', FNumeroEnPalabras.NumeroEnPalabras(1000001));
  CheckEqualsString('dos millones quinientos mil', FNumeroEnPalabras.NumeroEnPalabras(2500000));
  CheckEqualsString('nueve mil millones novecientos noventa y nueve mil novecientos noventa y nueve',
    FNumeroEnPalabras.NumeroEnPalabras(9000999999));
  CheckEqualsString('mil millones', FNumeroEnPalabras.NumeroEnPalabras(1000000000));
  CheckEqualsString('novecientos noventa y nueve mil millones novecientos noventa y nueve millones novecientos noventa y nueve mil novecientos noventa y nueve',
    FNumeroEnPalabras.NumeroEnPalabras(999999999999));
end;

procedure TestTNumeroEnPalabras.TestNegativos;
begin
  CheckEqualsString('menos uno', FNumeroEnPalabras.NumeroEnPalabras(-1));
end;

procedure TestTNumeroEnPalabras.TestNumeroEnPalabras;
begin
  CheckEqualsString('uno', FNumeroEnPalabras.NumeroEnPalabras(1));
  CheckEqualsString('diez', FNumeroEnPalabras.NumeroEnPalabras(10));
  CheckEqualsString('veintinueve', FNumeroEnPalabras.NumeroEnPalabras(29));
end;

procedure TestTNumeroEnPalabras.TestNumeroEnPalabrasExt;
begin
  CheckEqualsString('treinta', FNumeroEnPalabras.NumeroEnPalabras(30));
  CheckEqualsString('cuarenta', FNumeroEnPalabras.NumeroEnPalabras(40));
  CheckEqualsString('cuarenta y uno', FNumeroEnPalabras.NumeroEnPalabras(41));
end;

// Tests extraídos desde sitio de la Real Academia de la Lengua Española:
// http://buscon.rae.es/dpdI/SrvltGUIBusDPD?origen=RAE&lema=cardinales
procedure TestTNumeroEnPalabras.TestRAE;
begin
  CheckEqualsString('cero', FNumeroEnPalabras.NumeroEnPalabras(0));
  CheckEqualsString('uno', FNumeroEnPalabras.NumeroEnPalabras(1));
  CheckEqualsString('dos', FNumeroEnPalabras.NumeroEnPalabras(2));
  CheckEqualsString('tres', FNumeroEnPalabras.NumeroEnPalabras(3));
  CheckEqualsString('cuatro', FNumeroEnPalabras.NumeroEnPalabras(4));
  CheckEqualsString('cinco', FNumeroEnPalabras.NumeroEnPalabras(5));
  CheckEqualsString('seis', FNumeroEnPalabras.NumeroEnPalabras(6));
  CheckEqualsString('siete', FNumeroEnPalabras.NumeroEnPalabras(7));
  CheckEqualsString('ocho', FNumeroEnPalabras.NumeroEnPalabras(8));
  CheckEqualsString('nueve', FNumeroEnPalabras.NumeroEnPalabras(9));
  CheckEqualsString('diez', FNumeroEnPalabras.NumeroEnPalabras(10));
  CheckEqualsString('once', FNumeroEnPalabras.NumeroEnPalabras(11));
  CheckEqualsString('doce', FNumeroEnPalabras.NumeroEnPalabras(12));
  CheckEqualsString('trece', FNumeroEnPalabras.NumeroEnPalabras(13));
  CheckEqualsString('catorce', FNumeroEnPalabras.NumeroEnPalabras(14));
  CheckEqualsString('quince', FNumeroEnPalabras.NumeroEnPalabras(15));
  CheckEqualsString('dieciséis', FNumeroEnPalabras.NumeroEnPalabras(16));
  CheckEqualsString('diecisiete', FNumeroEnPalabras.NumeroEnPalabras(17));
  CheckEqualsString('dieciocho', FNumeroEnPalabras.NumeroEnPalabras(18));
  CheckEqualsString('diecinueve', FNumeroEnPalabras.NumeroEnPalabras(19));
  CheckEqualsString('veinte', FNumeroEnPalabras.NumeroEnPalabras(20));
  CheckEqualsString('veintiuno', FNumeroEnPalabras.NumeroEnPalabras(21));
  CheckEqualsString('veintidós', FNumeroEnPalabras.NumeroEnPalabras(22));
  CheckEqualsString('treinta', FNumeroEnPalabras.NumeroEnPalabras(30));
  CheckEqualsString('treinta y uno', FNumeroEnPalabras.NumeroEnPalabras(31));
  CheckEqualsString('treinta y dos', FNumeroEnPalabras.NumeroEnPalabras(32));
  CheckEqualsString('cuarenta', FNumeroEnPalabras.NumeroEnPalabras(40));
  CheckEqualsString('cuarenta y uno', FNumeroEnPalabras.NumeroEnPalabras(41));
  CheckEqualsString('cincuenta', FNumeroEnPalabras.NumeroEnPalabras(50));
  CheckEqualsString('sesenta', FNumeroEnPalabras.NumeroEnPalabras(60));
  CheckEqualsString('setenta', FNumeroEnPalabras.NumeroEnPalabras(70));
  CheckEqualsString('ochenta', FNumeroEnPalabras.NumeroEnPalabras(80));
  CheckEqualsString('noventa', FNumeroEnPalabras.NumeroEnPalabras(90));
  CheckEqualsString('cien', FNumeroEnPalabras.NumeroEnPalabras(100));
  CheckEqualsString('ciento uno', FNumeroEnPalabras.NumeroEnPalabras(101));
  CheckEqualsString('ciento diez', FNumeroEnPalabras.NumeroEnPalabras(110));
  CheckEqualsString('ciento once', FNumeroEnPalabras.NumeroEnPalabras(111));
  CheckEqualsString('ciento veinte', FNumeroEnPalabras.NumeroEnPalabras(120));
  CheckEqualsString('ciento veintiuno', FNumeroEnPalabras.NumeroEnPalabras(121));
  CheckEqualsString('ciento veintidós', FNumeroEnPalabras.NumeroEnPalabras(122));
  CheckEqualsString('ciento treinta', FNumeroEnPalabras.NumeroEnPalabras(130));
  CheckEqualsString('ciento treinta y uno', FNumeroEnPalabras.NumeroEnPalabras(131));
  CheckEqualsString('ciento treinta y dos', FNumeroEnPalabras.NumeroEnPalabras(132));
  CheckEqualsString('doscientos', FNumeroEnPalabras.NumeroEnPalabras(200));
  CheckEqualsString('trescientos', FNumeroEnPalabras.NumeroEnPalabras(300));
  CheckEqualsString('cuatrocientos', FNumeroEnPalabras.NumeroEnPalabras(400));
  CheckEqualsString('quinientos', FNumeroEnPalabras.NumeroEnPalabras(500));
  CheckEqualsString('seiscientos', FNumeroEnPalabras.NumeroEnPalabras(600));
  CheckEqualsString('setecientos', FNumeroEnPalabras.NumeroEnPalabras(700));
  CheckEqualsString('ochocientos', FNumeroEnPalabras.NumeroEnPalabras(800));
  CheckEqualsString('novecientos', FNumeroEnPalabras.NumeroEnPalabras(900));
  CheckEqualsString('mil', FNumeroEnPalabras.NumeroEnPalabras(1000));
  CheckEqualsString('mil uno', FNumeroEnPalabras.NumeroEnPalabras(1001)); // "mil uno pesos" es correcto?
  CheckEqualsString('mil dos', FNumeroEnPalabras.NumeroEnPalabras(1002));
  CheckEqualsString('mil diez', FNumeroEnPalabras.NumeroEnPalabras(1010));
  CheckEqualsString('mil once', FNumeroEnPalabras.NumeroEnPalabras(1011));
  CheckEqualsString('mil veinte', FNumeroEnPalabras.NumeroEnPalabras(1020));
  CheckEqualsString('mil veintiuno', FNumeroEnPalabras.NumeroEnPalabras(1021));
  CheckEqualsString('mil veintidós', FNumeroEnPalabras.NumeroEnPalabras(1022));
  CheckEqualsString('mil veintitrés', FNumeroEnPalabras.NumeroEnPalabras(1023));
  CheckEqualsString('mil treinta', FNumeroEnPalabras.NumeroEnPalabras(1030));
  CheckEqualsString('mil treinta y uno', FNumeroEnPalabras.NumeroEnPalabras(1031));
  CheckEqualsString('mil cien', FNumeroEnPalabras.NumeroEnPalabras(1100));
  CheckEqualsString('mil ciento uno', FNumeroEnPalabras.NumeroEnPalabras(1101));
  CheckEqualsString('mil doscientos', FNumeroEnPalabras.NumeroEnPalabras(1200));
  CheckEqualsString('dos mil', FNumeroEnPalabras.NumeroEnPalabras(2000));
  CheckEqualsString('dos mil uno', FNumeroEnPalabras.NumeroEnPalabras(2001));
  CheckEqualsString('dos mil veinte', FNumeroEnPalabras.NumeroEnPalabras(2020));
  CheckEqualsString('dos mil veintiuno', FNumeroEnPalabras.NumeroEnPalabras(2021));
  CheckEqualsString('dos mil cien', FNumeroEnPalabras.NumeroEnPalabras(2100));
  CheckEqualsString('dos mil ciento uno', FNumeroEnPalabras.NumeroEnPalabras(2101));
  CheckEqualsString('diez mil', FNumeroEnPalabras.NumeroEnPalabras(10000));
  CheckEqualsString('veinte mil', FNumeroEnPalabras.NumeroEnPalabras(20000));
  CheckEqualsString('veintiún mil', FNumeroEnPalabras.NumeroEnPalabras(21000));
  CheckEqualsString('treinta mil', FNumeroEnPalabras.NumeroEnPalabras(30000));
  CheckEqualsString('treinta y un mil', FNumeroEnPalabras.NumeroEnPalabras(31000));
  CheckEqualsString('cuarenta mil', FNumeroEnPalabras.NumeroEnPalabras(40000));
  CheckEqualsString('cien mil', FNumeroEnPalabras.NumeroEnPalabras(100000));
  CheckEqualsString('doscientos mil', FNumeroEnPalabras.NumeroEnPalabras(200000));
  CheckEqualsString('un millón', FNumeroEnPalabras.NumeroEnPalabras(1000000));
  CheckEqualsString('un millón uno', FNumeroEnPalabras.NumeroEnPalabras(1000001));
  CheckEqualsString('un millón cien', FNumeroEnPalabras.NumeroEnPalabras(1000100));
  CheckEqualsString('un millón mil', FNumeroEnPalabras.NumeroEnPalabras(1001000));
  CheckEqualsString('dos millones', FNumeroEnPalabras.NumeroEnPalabras(2000000));
  CheckEqualsString('diez millones', FNumeroEnPalabras.NumeroEnPalabras(10000000));
  CheckEqualsString('cien millones', FNumeroEnPalabras.NumeroEnPalabras(100000000));
  CheckEqualsString('mil millones', FNumeroEnPalabras.NumeroEnPalabras(1000000000));
  CheckEqualsString('un billón', FNumeroEnPalabras.NumeroEnPalabras(1000000000000));
  // Out of bounds!
  //  CheckEqualsString('un trillón', FNumeroEnPalabras.NumeroEnPalabras(10000000000000000000));
  //  CheckEqualsString('un cuatrillón', FNumeroEnPalabras.NumeroEnPalabras(10000000000000000000000000));
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTNumeroEnPalabras.Suite);
end.
