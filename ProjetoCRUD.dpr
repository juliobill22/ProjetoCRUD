program ProjetoCRUD;

uses
  Vcl.Forms,
  frmPrincipal in 'frmPrincipal.pas' {FormPrincipal},
  frmCadBase in 'FormBase\frmCadBase.pas' {FormBase},
  dmBase in 'FormBase\dmBase.pas' {DataModuleBase: TDataModule},
  frmCadCliente in 'frmCadCliente.pas' {FormCadCliente},
  frmCadProduto in 'frmCadProduto.pas' {FormCadProduto},
  frmCadPedidos in 'frmCadPedidos.pas' {FormCadPedidos},
  frmPesquisa in 'frmPesquisa.pas' {FormPesquisa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModuleBase, DataModuleBase);
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormPesquisa, FormPesquisa);
  Application.Run;

end.
