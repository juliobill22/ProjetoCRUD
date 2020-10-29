inherited FormCadProduto: TFormCadProduto
  Caption = 'Cadastro de Produtos'
  ClientWidth = 570
  ExplicitWidth = 586
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Width = 570
    ExplicitWidth = 570
  end
  inherited Panel1: TPanel
    Width = 570
    ExplicitWidth = 570
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 16
      Top = 67
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = DBEdit2
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 40
      Width = 134
      Height = 21
      DataField = 'codigoproduto'
      DataSource = DataSourceModelo
      Enabled = False
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 86
      Width = 539
      Height = 21
      DataField = 'descricao'
      DataSource = DataSourceModelo
      TabOrder = 1
    end
  end
  inherited pnTitulo: TPanel
    Width = 564
    ExplicitWidth = 564
    inherited lblTitulo: TLabel
      Left = 413
      Top = 13
      Width = 139
      Caption = 'Cadastro de Produtos'
      ExplicitLeft = 413
      ExplicitTop = 13
      ExplicitWidth = 139
    end
  end
  inherited Panel2: TPanel
    Width = 570
    ExplicitWidth = 570
  end
  inherited FDUpdateSQLModelo: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO [dbo].[produtos]'
      '           ([codigoproduto]'
      '           ,[descricao])'
      '     VALUES'
      '           (:codigoproduto'
      '           ,:descricao)')
    ModifySQL.Strings = (
      'UPDATE [dbo].[produtos]'
      '   SET [codigoproduto] = :codigoproduto'
      '      ,[descricao] = :descricao'
      ' WHERE [codigoproduto] = :codigoproduto')
    DeleteSQL.Strings = (
      'DELETE FROM [dbo].[produtos]'
      '      WHERE [codigoproduto] = :codigoproduto')
  end
  inherited FDQueryModelo: TFDQuery
    OnNewRecord = FDQueryModeloNewRecord
    SQL.Strings = (
      'SELECT [codigoproduto]'
      '      ,[descricao]'
      '  FROM [dbo].[produtos]')
    object FDQueryModelocodigoproduto: TIntegerField
      FieldName = 'codigoproduto'
      Origin = 'codigoproduto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryModelodescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 250
    end
  end
end
