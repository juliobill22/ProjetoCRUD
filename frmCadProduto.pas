unit frmCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmCadBase, FireDAC.Stan.Intf,
  FireDAC.Stan.Param, FireDAC.Phys.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.ImageList, Vcl.ImgList, Vcl.DBCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask;

type
  TFormCadProduto = class(TFormBase)
    FDQueryModelocodigoproduto: TIntegerField;
    FDQueryModelodescricao: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure FDQueryModeloNewRecord(DataSet: TDataSet);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadProduto: TFormCadProduto;

implementation

uses dmBase;

{$R *.dfm}

procedure TFormCadProduto.btnNovoClick(Sender: TObject);
begin
  inherited;
  DBEdit2.SetFocus;
end;

procedure TFormCadProduto.FDQueryModeloNewRecord(DataSet: TDataSet);
begin
  inherited;
  FDQueryModelocodigoproduto.AsInteger := DataModuleBase.nextSequenceProduto;
end;

end.
