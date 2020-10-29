unit frmCadBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Data.FMTBcd, Data.DB, Data.SqlExpr,
  Vcl.DBCtrls, Data.Win.ADODB, Vcl.StdCtrls, Vcl.Mask, FireDAC.Stan.Intf,
  FireDAC.Stan.Param, FireDAC.Phys.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.Def,
  FireDAC.VCLUI.Wait, FireDAC.Phys.ASAWrapper, FireDAC.Phys,
  FireDAC.Phys.ODBCBase, FireDAC.Phys.ASA, Vcl.Buttons;

type
  TFormBase = class(TForm)
    StatusBar: TStatusBar;
    Panel1: TPanel;
    ImageList: TImageList;
    DataSourceModelo: TDataSource;
    FDUpdateSQLModelo: TFDUpdateSQL;
    FDQueryModelo: TFDQuery;
    lblTitulo: TLabel;
    Panel2: TPanel;
    DBNavigator2: TDBNavigator;
    btnNovo: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnExcluir: TSpeedButton;
    btnSalvar: TSpeedButton;
    btnCancelar: TSpeedButton;
    pnTitulo: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure DataSourceModeloStateChange(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    function MontaMsgValidacao: String;
  public
    { Public declarations }
    procedure Salvar;
    procedure SalvarComChield(var AQryChield: TFDQuery; ADescr : String);
    procedure Excluir;
    procedure ExcluirComChield(var AQryChield: TFDQuery; ADescr : String);
  end;

var
  FormBase: TFormBase;

implementation

uses dmBase;

{$R *.dfm}

procedure TFormBase.DataSourceModeloStateChange(Sender: TObject);
begin

  btnAlterar.Enabled := (not(FDQueryModelo.State = dsInsert) or
    not(FDQueryModelo.State = dsEdit)) and not FDQueryModelo.IsEmpty;
  btnSalvar.Enabled := ((FDQueryModelo.State = dsInsert) or
    (FDQueryModelo.State = dsEdit)) and (not FDQueryModelo.IsEmpty);
  btnCancelar.Enabled := ((FDQueryModelo.State = dsInsert) or
    (FDQueryModelo.State = dsEdit)) and not FDQueryModelo.IsEmpty;
  btnExcluir.Enabled := (not(FDQueryModelo.State = dsInsert)) and
    not FDQueryModelo.IsEmpty;

  case FDQueryModelo.UpdateStatus of
    usModified:
      begin
        StatusBar.panels.Items[0].Text := 'UpdateStatus: Alterado';
      end;
    usInserted:
      begin
        StatusBar.panels.Items[0].Text := 'UpdateStatus: Salvo';
      end;
    usDeleted:
      begin
        StatusBar.panels.Items[0].Text := 'UpdateStatus: Excluido';
      end;
    usUnmodified:
      begin
        StatusBar.panels.Items[0].Text := 'UpdateStatus: Não modificado';
      end;
  end;

  case FDQueryModelo.State of
    dsInsert:
      begin
        StatusBar.panels.Items[1].Text := 'State: Insert';
      end;
    dsEdit:
      begin
        StatusBar.panels.Items[1].Text := 'State: Edit';
      end;
    dsBrowse:
      begin
        StatusBar.panels.Items[1].Text := 'State: Browse';
      end;
    dsInactive:
      begin
        StatusBar.panels.Items[1].Text := 'State: Inativo';
      end;
  end;

end;

procedure TFormBase.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FDQueryModelo.Close;
  Action := caFree;
end;

procedure TFormBase.FormCreate(Sender: TObject);
begin
  FDQueryModelo.Close;
  FDQueryModelo.Open;
end;

function TFormBase.MontaMsgValidacao: String;
var
  i: Integer;
begin
  for i := 0 to FDQueryModelo.Fields.Count - 1 do
  begin
    if (FDQueryModelo.Fields[i].Required and FDQueryModelo.Fields[i].IsNull)
    then
      result := result + 'O campo ' + FDQueryModelo.Fields[i].DisplayName +
        ' é requirido!' + #10 + #13;
  end;
end;

procedure TFormBase.Salvar;
var
  vMsg: String;
  B: TBookmark;
  State: TDataSetState;
begin
  B := FDQueryModelo.GetBookmark;
  if FDQueryModelo.Active then
  begin
    vMsg := MontaMsgValidacao;
    if not(vMsg = '') then
    begin
      MessageDlg(vMsg, mtWarning, [mbOK], 0);
    end
    else
    begin
      if not FDQueryModelo.IsEmpty then
      begin
        if MessageDlg('Deseja realmente salvar?', mtConfirmation, [mbYes, mbNo],
          0) = mrYes then
        begin
          State := FDQueryModelo.State;
          if State in [dsInsert, dsEdit] then
            FDQueryModelo.Post;

          FDQueryModelo.ApplyUpdates(0);
          FDQueryModelo.Close;
          FDQueryModelo.Open;

          if State = dsEdit then
            FDQueryModelo.Bookmark := B
          else
            FDQueryModelo.Last;
        end;
      end;
    end;
  end;
end;

procedure TFormBase.SalvarComChield(var AQryChield: TFDQuery; ADescr : String);
var
  vMsg: String;
  B: TBookmark;
  State: TDataSetState;
begin
  B := FDQueryModelo.GetBookmark;
  if FDQueryModelo.Active then
  begin
    vMsg := MontaMsgValidacao;
    if not(vMsg = '') then
    begin
      MessageDlg(vMsg, mtWarning, [mbOK], 0);
    end
    else
    begin
      if not FDQueryModelo.IsEmpty then
      begin
        if MessageDlg('Deseja realmente salvar este '+ADescr+'?', mtConfirmation, [mbYes, mbNo],
          0) = mrYes then
        begin
          State := FDQueryModelo.State;
          if State in [dsInsert, dsEdit] then
            FDQueryModelo.Post;

          FDQueryModelo.ApplyUpdates(0);

          if AQryChield.State in [dsInsert, dsEdit] then
            AQryChield.Post;
          AQryChield.ApplyUpdates(0);

          FDQueryModelo.Close;
          FDQueryModelo.Open;

          if State = dsEdit then
            FDQueryModelo.Bookmark := B
          else
            FDQueryModelo.Last;

          AQryChield.Close;
          AQryChield.Open;

        end;
      end;
    end;
  end;
end;

procedure TFormBase.btnNovoClick(Sender: TObject);
begin
  if FDQueryModelo.Active then
    FDQueryModelo.Insert;
end;

procedure TFormBase.Excluir;
var
  iRecNo: Integer;
begin
  try
    if FDQueryModelo.Active then
    begin
      if not FDQueryModelo.IsEmpty then
      begin
        if MessageDlg('Deseja realmente exluir este registor?', mtConfirmation,
          [mbYes, mbNo], 0) = mrYes then
        begin
          FDQueryModelo.Delete;
          FDQueryModelo.ApplyUpdates(0);
          FDQueryModelo.Close;
          FDQueryModelo.Open;
        end;
      end;
    end;
  finally
  end;
end;

procedure TFormBase.ExcluirComChield(var AQryChield: TFDQuery; ADescr : String);
var
  iRecNo: Integer;
begin
  try
    if FDQueryModelo.Active then
    begin
      if not FDQueryModelo.IsEmpty then
      begin
        if MessageDlg('Deseja realmente exluir este '+ADescr+'?', mtConfirmation,
          [mbYes, mbNo], 0) = mrYes then
        begin
          AQryChield.Delete;
          AQryChield.ApplyUpdates(0);
          AQryChield.Close;
          AQryChield.Open;

          FDQueryModelo.Delete;
          FDQueryModelo.ApplyUpdates(0);
          FDQueryModelo.Close;
          FDQueryModelo.Open;
        end;
      end;
    end;
  finally
  end;
end;

procedure TFormBase.btnAlterarClick(Sender: TObject);
var
  vMsg: String;
begin
  try
    if FDQueryModelo.Active then
    begin
      vMsg := MontaMsgValidacao;
      if not(vMsg = '') then
      begin
        MessageDlg(vMsg, mtWarning, [mbOK], 0);
      end
      else
      begin
        if not FDQueryModelo.IsEmpty then
          FDQueryModelo.Edit;
      end;
    end;
  finally
  end;
end;

procedure TFormBase.btnExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TFormBase.btnSalvarClick(Sender: TObject);
begin
  Salvar;
end;

procedure TFormBase.btnCancelarClick(Sender: TObject);
var
  B: TBookmark;
begin
  FDQueryModelo.Bookmark := B;
  if FDQueryModelo.Active then
  begin
    if not FDQueryModelo.IsEmpty then
    begin
      if MessageDlg('Deseja realmente cancelar as alterações?', mtConfirmation,
        [mbYes, mbNo], 0) = mrYes then
      begin
        if FDQueryModelo.State in [dsInsert, dsEdit] then
        begin
          FDQueryModelo.Cancel;
          FDQueryModelo.CancelUpdates;
          FDQueryModelo.Close;
          FDQueryModelo.Open;
          FDQueryModelo.Bookmark := B;
        end;
      end;
    end;
  end;
end;

end.
