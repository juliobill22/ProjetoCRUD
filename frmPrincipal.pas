unit frmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.FMTBcd, Vcl.Menus, Data.DB,
  Data.SqlExpr, Data.Win.ADODB, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TFormPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    Cliente1: TMenuItem;
    Produtos1: TMenuItem;
    Pedidos1: TMenuItem;
    Pedidos2: TMenuItem;
    procedure Cliente1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Pedidos2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

uses frmCadCliente, frmCadProduto, frmCadPedidos;

{$R *.dfm}

procedure TFormPrincipal.Cliente1Click(Sender: TObject);
begin
  Application.CreateForm(TFormCadCliente, FormCadCliente);
end;

procedure TFormPrincipal.Pedidos2Click(Sender: TObject);
begin
  Application.CreateForm(TFormCadPedidos, FormCadPedidos);
end;

procedure TFormPrincipal.Produtos1Click(Sender: TObject);
begin
  Application.CreateForm(TFormCadProduto, FormCadProduto);
end;

end.
