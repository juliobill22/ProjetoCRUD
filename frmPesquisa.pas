unit frmPesquisa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFormPesquisa = class(TForm)
    DSQueryLookupProdutos: TDataSource;
    FDQueryLookupProdutos: TFDQuery;
    FDQueryLookupProdutoscodigoproduto: TIntegerField;
    FDQueryLookupProdutosdescricao: TStringField;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    AProduto : Integer;
  public
    property Produto : Integer read AProduto write AProduto;
  end;

var
  FormPesquisa: TFormPesquisa;

implementation

uses dmBase;

{$R *.dfm}

procedure TFormPesquisa.DBGrid1DblClick(Sender: TObject);
begin
  Close;
end;

procedure TFormPesquisa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  AProduto := FDQueryLookupProdutoscodigoproduto.AsInteger;
end;

procedure TFormPesquisa.FormCreate(Sender: TObject);
begin
  FDQueryLookupProdutos.Close;
  FDQueryLookupProdutos.Open;
end;

end.
