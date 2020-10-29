unit dmBase;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet;

type
  TDataModuleBase = class(TDataModule)
    FDConnection: TFDConnection;
    FDQuery: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    function executeQuery(aSql: String): integer;
  public
    function nextSequenceCliente: integer;
    function nextSequenceProduto: integer;
    function nextSequencePedido: integer;
  end;

var
  DataModuleBase: TDataModuleBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}
{$R *.dfm}

procedure TDataModuleBase.DataModuleCreate(Sender: TObject);
begin
  FDConnection.Close;
  FDConnection.Connected := True;
end;

function TDataModuleBase.executeQuery(aSql: String): integer;
begin
  try
    FDQuery.SQL.Text := aSql;
    FDQuery.Open;
    result := FDQuery.FieldByName('sequence').AsInteger;
    FDQuery.Close;
  finally
  end;
end;

function TDataModuleBase.nextSequenceCliente: integer;
begin
  result := executeQuery
    ('select isnull(max(codigocliente),0)+1 as sequence from clientes');
end;

function TDataModuleBase.nextSequenceProduto: integer;
begin
  result := executeQuery
    ('select isnull(max(codigoproduto),0)+1 as sequence from produtos');
end;

function TDataModuleBase.nextSequencePedido: integer;
begin
  result := executeQuery
    ('select isnull(max(codigopedido),0)+1 as sequence from pedidos');
end;

end.
