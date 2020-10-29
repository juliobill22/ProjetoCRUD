unit frmCadPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmCadBase, FireDAC.Stan.Intf,
  FireDAC.Stan.Param, FireDAC.Phys.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Data.DB, Vcl.Menus,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, System.ImageList, Vcl.ImgList,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TFormCadPedidos = class(TFormBase)
    DBLookupComboBox1: TDBLookupComboBox;
    FDQueryLookupClientes: TFDQuery;
    DSQueryLookupClientes: TDataSource;
    FDQueryLookupTipoOperacao: TFDQuery;
    FDQueryLookupTipoOperacaotipooperacao: TIntegerField;
    FDQueryLookupTipoOperacaoDescricao: TStringField;
    DSQueryLookupTipoOperacao: TDataSource;
    DSQueryLookupProdutos: TDataSource;
    FDQueryLookupProdutos: TFDQuery;
    PopupMenu1: TPopupMenu;
    mnuExcluirItem: TMenuItem;
    FDQueryItemsPedido: TFDQuery;
    FDUpdateSQLItemsPedido: TFDUpdateSQL;
    DataSourceItemsPedido: TDataSource;
    FDQueryModelocodigopedido: TIntegerField;
    FDQueryModeloreferencia: TStringField;
    FDQueryModelonumeropedido: TStringField;
    FDQueryModelodataemissao: TDateField;
    FDQueryModelocodigocliente: TIntegerField;
    FDQueryModelotipooperacao: TIntegerField;
    FDQueryModelototalpedido: TSingleField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    FDQueryLookupClientescodigocliente: TIntegerField;
    FDQueryLookupClientesnomecliente: TStringField;
    Label8: TLabel;
    Label9: TLabel;
    DBGrid1: TDBGrid;
    FDQueryItemsPedidocodigoproduto: TIntegerField;
    FDQueryItemsPedidoquantidade: TIntegerField;
    FDQueryItemsPedidovalorunitario: TSingleField;
    FDQueryItemsPedidototalitem: TSingleField;
    FDQueryItemsPedidocodigopedido: TIntegerField;
    DBText1: TDBText;
    FDQueryLookupProdutoscodigoproduto: TIntegerField;
    FDQueryLookupProdutosdescricao: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FDQueryModeloNewRecord(DataSet: TDataSet);
    procedure btnSalvarClick(Sender: TObject);
    procedure FDQueryItemsPedidovalorunitarioValidate(Sender: TField);
    procedure FDQueryItemsPedidoAfterPost(DataSet: TDataSet);
    procedure FDQueryModeloAfterScroll(DataSet: TDataSet);
    procedure FDQueryItemsPedidoNewRecord(DataSet: TDataSet);
    procedure btnExcluirClick(Sender: TObject);
    procedure DBGrid1EditButtonClick(Sender: TObject);
  private
    function TotalPedido: Double;
  public
    { Public declarations }
  end;

var
  FormCadPedidos: TFormCadPedidos;

implementation

uses dmBase, frmPesquisa;

{$R *.dfm}

procedure TFormCadPedidos.btnExcluirClick(Sender: TObject);
begin
  ExcluirComChield(FDQueryItemsPedido, 'pedido');
end;

procedure TFormCadPedidos.btnNovoClick(Sender: TObject);
begin
  inherited;
  FDQueryItemsPedido.Close;
  FDQueryItemsPedido.Open;
  DBEdit2.SetFocus;
end;

procedure TFormCadPedidos.btnSalvarClick(Sender: TObject);
begin
  if (FDQueryItemsPedido.RecordCount = 0) or ((FDQueryItemsPedido.IsEmpty)) then
  begin
    MessageDlg('Insira os items do pedido!', mtWarning, [mbOK], 0);
    DBGrid1.SetFocus;
    Exit;
  end;
  SalvarComChield(FDQueryItemsPedido, 'pedido');
end;

procedure TFormCadPedidos.DBGrid1EditButtonClick(Sender: TObject);
var
  AFormPesquisa: TFormPesquisa;
begin
  AFormPesquisa := TFormPesquisa.Create(Owner);
  try
    AFormPesquisa.ShowModal;
    if not(FDQueryItemsPedido.State in [dsInsert, dsEdit]) then
      FDQueryItemsPedido.Edit;
    FDQueryItemsPedidocodigoproduto.AsInteger := AFormPesquisa.Produto;
  finally
    AFormPesquisa.Free;
  end;
end;

procedure TFormCadPedidos.FDQueryItemsPedidoAfterPost(DataSet: TDataSet);
begin
  inherited;
  TotalPedido;
end;

procedure TFormCadPedidos.FDQueryItemsPedidoNewRecord(DataSet: TDataSet);
begin
  inherited;
  FDQueryItemsPedidocodigopedido.AsInteger :=
    FDQueryModelocodigopedido.AsInteger;
end;

procedure TFormCadPedidos.FDQueryItemsPedidovalorunitarioValidate
  (Sender: TField);
begin
  inherited;
  FDQueryItemsPedidototalitem.AsFloat := FDQueryItemsPedidoquantidade.AsInteger
    * FDQueryItemsPedidovalorunitario.AsFloat;
end;

procedure TFormCadPedidos.FDQueryModeloAfterScroll(DataSet: TDataSet);
begin
  inherited;
  FDQueryItemsPedido.Close;
  FDQueryItemsPedido.Params.FindParam('CODIGOPEDIDO').AsInteger :=
    FDQueryModelocodigopedido.AsInteger;
  FDQueryItemsPedido.Open;
end;

procedure TFormCadPedidos.FDQueryModeloNewRecord(DataSet: TDataSet);
begin
  inherited;
  FDQueryModelocodigopedido.AsInteger := DataModuleBase.nextSequencePedido;
  FDQueryModelodataemissao.AsDateTime := Now;
end;

procedure TFormCadPedidos.FormCreate(Sender: TObject);
begin
  inherited;
  FDQueryLookupClientes.Close;
  FDQueryLookupClientes.Open;
  FDQueryLookupTipoOperacao.Close;
  FDQueryLookupTipoOperacao.Open;
  FDQueryLookupProdutos.Close;
  FDQueryLookupProdutos.Open;
end;

function TFormCadPedidos.TotalPedido: Double;
var
  aBookMark: TBookmark;
  avalor: Double;
begin
  try
    FDQueryItemsPedido.DisableControls;
    aBookMark := FDQueryItemsPedido.Bookmark;
    FDQueryItemsPedido.First;
    avalor := 0;
    while not FDQueryItemsPedido.eof do
    begin
      avalor := avalor + FDQueryItemsPedidototalitem.AsFloat;
      FDQueryItemsPedido.Next;
    end;

    if not(FDQueryModelo.State in [dsEdit]) then
      FDQueryModelo.Edit;
    FDQueryModelototalpedido.AsFloat := avalor;

  finally
    FDQueryItemsPedido.Bookmark := aBookMark;
    FDQueryItemsPedido.EnableControls;
  end;
end;

end.
