unit frmCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, frmCadBase, FireDAC.Stan.Intf,
  FireDAC.Stan.Param, FireDAC.Phys.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  System.ImageList, Vcl.ImgList, Vcl.DBCtrls, Vcl.Buttons, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, REST.Types, REST.Client, System.JSON,
  Data.Bind.Components, Data.Bind.ObjectScope;

type
  TFormCadCliente = class(TFormBase)
    FDQueryModelocodigocliente: TIntegerField;
    FDQueryModelonomecliente: TStringField;
    FDQueryModelocep: TStringField;
    FDQueryModelologradouro: TStringField;
    FDQueryModelocomplemento: TStringField;
    FDQueryModelobairro: TStringField;
    FDQueryModelocidade: TStringField;
    FDQueryModelouf: TStringField;
    FDQueryModelocodigoibge: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBComboUF: TDBComboBox;
    DBEdit7: TDBEdit;
    Label7: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    procedure DBEdit3Exit(Sender: TObject);
    procedure FDQueryModeloNewRecord(DataSet: TDataSet);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormCadCliente: TFormCadCliente;

implementation

uses dmBase;

{$R *.dfm}

procedure TFormCadCliente.btnNovoClick(Sender: TObject);
begin
  inherited;
  DBEdit2.SetFocus;
end;

procedure TFormCadCliente.DBEdit3Exit(Sender: TObject);
var
  jsonValue: TJSonValue;
  RESTClient1: TRESTClient;
  RESTRequest1: TRESTRequest;
begin
  inherited;
  if FDQueryModelocep.AsString <> '' then
  begin
    try
      RESTClient1 := TRESTClient.Create('');
      RESTRequest1 := TRESTRequest.Create(Owner);
      RESTRequest1.Client := RESTClient1;
      try
        RESTClient1.BaseURL := 'https://viacep.com.br/';
        RESTRequest1.Accept := '*/*';
        RESTRequest1.Method := TRESTRequestMethod.rmGET;
        RESTRequest1.Resource := '/ws/' + FDQueryModelocep.AsString + '/json/';
        RESTRequest1.Execute;

        jsonValue := RESTRequest1.Response.jsonValue;

        FDQueryModelo.Edit;
        if not(jsonValue.GetValue<string>('cep') = '') then
        begin
          FDQueryModelologradouro.AsString := jsonValue.GetValue<string>
            ('logradouro');
          FDQueryModelocomplemento.AsString :=
            jsonValue.GetValue<string>('complemento');
          FDQueryModelobairro.AsString := jsonValue.GetValue<string>('bairro');
          FDQueryModelocidade.AsString := jsonValue.GetValue<string>
            ('localidade');
          FDQueryModelouf.AsString := jsonValue.GetValue<string>('uf');
          FDQueryModelocodigoibge.AsString :=
            jsonValue.GetValue<string>('ibge');
        end;
      except

        FDQueryModelo.Edit;
        FDQueryModelologradouro.AsString := '';
        FDQueryModelocomplemento.AsString := '';
        FDQueryModelobairro.AsString := '';
        FDQueryModelocidade.AsString := '';
        FDQueryModelouf.AsString := '';
        FDQueryModelocodigoibge.AsString := '';
      end;
    finally
      RESTClient1.Free;
      RESTRequest1.Free;
    end;
  end;
end;

procedure TFormCadCliente.FDQueryModeloNewRecord(DataSet: TDataSet);
begin
  inherited;
  FDQueryModelocodigocliente.AsInteger := DataModuleBase.nextSequenceCliente;
end;

end.
