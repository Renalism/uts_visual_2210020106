unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, Grids, DBGrids, StdCtrls;

type
  TForm1 = class(TForm)
    DBGrid1: TDBGrid;
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  // Setup ZConnection
  ZConnection1.Database := 'db_penjualan';
  ZConnection1.HostName := 'localhost';
  ZConnection1.LibraryLocation := 'libMySql.dll';
  ZConnection1.Port := 3306;
  ZConnection1.Protocol := 'mysql';
  ZConnection1.User := 'root';
  ZConnection1.Password := ''; // Set password sesuai kebutuhan
  ZConnection1.Connected := True;

  // Setup ZQuery
  ZQuery1.Connection := ZConnection1;
  ZQuery1.SQL.Text := 'SELECT * FROM satuan';
  ZQuery1.Open;

  // Setup DataSource
  DataSource1.DataSet := ZQuery1;

  // Link DataSource to DBGrid
  DBGrid1.DataSource := DataSource1;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  try
    ZQuery1.Append; // Memulai mode penambahan data baru
    ZQuery1.FieldByName('id').AsString := Edit1.Text; // Sesuaikan dengan nama field yang benar
    ZQuery1.FieldByName('name').AsString := Edit2.Text; // Sesuaikan dengan nama field yang benar
    ZQuery1.Post; // Menyimpan data ke dalam tabel
    ShowMessage('Data berhasil disimpan.');
  except
    on E: Exception do
      ShowMessage('Error: ' + E.Message);
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    try
    if not ZQuery1.IsEmpty then
    begin
      ZQuery1.Edit;
      ZQuery1.FieldByName('id').AsString := Edit1.Text; // Sesuaikan dengan nama field yang benar
      ZQuery1.FieldByName('name').AsString := Edit2.Text; // Sesuaikan dengan nama field yang benar
      ZQuery1.Post;
    end;
  except
    on E: Exception do
    begin
      ShowMessage('Error: ' + E.Message);
      ZQuery1.Cancel; // Batalkan perubahan jika terjadi kesalahan
    end;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if not ZQuery1.IsEmpty then
  begin
    ZQuery1.Delete;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  if ZQuery1.State in [dsEdit, dsInsert] then
  begin
    ZQuery1.Cancel;
  end;
end;

end.

