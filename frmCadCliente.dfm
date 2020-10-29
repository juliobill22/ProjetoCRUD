inherited FormCadCliente: TFormCadCliente
  Caption = 'Cadastro de Clientes'
  ClientHeight = 482
  ClientWidth = 575
  ExplicitWidth = 591
  ExplicitHeight = 521
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Top = 463
    Width = 575
    ExplicitTop = 463
    ExplicitWidth = 575
  end
  inherited Panel1: TPanel
    Width = 575
    Height = 383
    ExplicitWidth = 575
    ExplicitHeight = 383
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 16
      Top = 56
      Width = 27
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 16
      Top = 96
      Width = 19
      Height = 13
      Caption = 'Cep'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 154
      Top = 96
      Width = 55
      Height = 13
      Caption = 'Logradouro'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 357
      Top = 96
      Width = 65
      Height = 13
      Caption = 'Complemento'
      FocusControl = DBEdit5
    end
    object Label8: TLabel
      Left = 514
      Top = 136
      Width = 13
      Height = 13
      Caption = 'UF'
    end
    object Label7: TLabel
      Left = 227
      Top = 136
      Width = 33
      Height = 13
      Caption = 'Cidade'
      FocusControl = DBEdit7
    end
    object Label6: TLabel
      Left = 16
      Top = 136
      Width = 28
      Height = 13
      Caption = 'Bairro'
      FocusControl = DBEdit6
    end
    object Label9: TLabel
      Left = 16
      Top = 178
      Width = 59
      Height = 13
      Caption = 'C'#243'digo IBGE'
      FocusControl = DBEdit9
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 32
      Width = 134
      Height = 21
      DataField = 'codigocliente'
      DataSource = DataSourceModelo
      Enabled = False
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 72
      Width = 540
      Height = 21
      DataField = 'nomecliente'
      DataSource = DataSourceModelo
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 16
      Top = 112
      Width = 134
      Height = 21
      DataField = 'cep'
      DataSource = DataSourceModelo
      TabOrder = 2
      OnExit = DBEdit3Exit
    end
    object DBEdit4: TDBEdit
      Left = 154
      Top = 112
      Width = 199
      Height = 21
      DataField = 'logradouro'
      DataSource = DataSourceModelo
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 357
      Top = 112
      Width = 199
      Height = 21
      DataField = 'complemento'
      DataSource = DataSourceModelo
      TabOrder = 4
    end
    object DBComboUF: TDBComboBox
      Left = 514
      Top = 152
      Width = 42
      Height = 21
      DataField = 'uf'
      DataSource = DataSourceModelo
      Items.Strings = (
        'AC'
        'AL'
        'AP'
        'AM'
        'BA'
        'CE'
        'DF'
        'ES'
        'GO'
        'MA'
        'MT'
        'MS'
        'MG'
        'PA'
        'PB'
        'PR'
        'PE'
        'PI'
        'RJ'
        'RN'
        'RS'
        'RO'
        'RR'
        'SC'
        'SP'
        'SE'
        'TO')
      TabOrder = 5
    end
    object DBEdit7: TDBEdit
      Left = 227
      Top = 152
      Width = 280
      Height = 21
      DataField = 'cidade'
      DataSource = DataSourceModelo
      TabOrder = 6
    end
    object DBEdit6: TDBEdit
      Left = 16
      Top = 152
      Width = 205
      Height = 21
      DataField = 'bairro'
      DataSource = DataSourceModelo
      TabOrder = 7
    end
    object DBEdit9: TDBEdit
      Left = 16
      Top = 195
      Width = 265
      Height = 21
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataField = 'codigoibge'
      DataSource = DataSourceModelo
      TabOrder = 8
    end
  end
  inherited pnTitulo: TPanel
    Width = 569
    ExplicitWidth = 569
    inherited lblTitulo: TLabel
      Left = 426
      Top = 13
      Width = 135
      Caption = 'Cadastro de Clientes'
      ExplicitLeft = 426
      ExplicitTop = 13
      ExplicitWidth = 135
    end
  end
  inherited Panel2: TPanel
    Top = 435
    Width = 575
    ExplicitTop = 435
    ExplicitWidth = 575
  end
  inherited FDUpdateSQLModelo: TFDUpdateSQL
    InsertSQL.Strings = (
      'INSERT INTO [dbo].[clientes]'
      '           ([codigocliente]'
      '           ,[nomecliente]'
      '           ,[cep]'
      '           ,[logradouro]'
      '           ,[complemento]'
      '           ,[bairro]'
      '           ,[cidade]'
      '           ,[uf]'
      '           ,[codigoibge])'
      '     VALUES'
      '           (:codigocliente'
      '           ,:nomecliente'
      '           ,:cep'
      '           ,:logradouro'
      '           ,:complemento'
      '           ,:bairro'
      '           ,:cidade'
      '           ,:uf'
      '           ,:codigoibge)')
    ModifySQL.Strings = (
      'UPDATE [dbo].[clientes]'
      '   SET [codigocliente] = :codigocliente'
      '      ,[nomecliente] = :nomecliente'
      '      ,[cep] = :cep'
      '      ,[logradouro] = :logradouro'
      '      ,[complemento] = :complemento'
      '      ,[bairro] = :bairro'
      '      ,[cidade] = :cidade'
      '      ,[uf] = :uf'
      '      ,[codigoibge] = :codigoibge'
      ' WHERE [codigocliente] = :codigocliente')
    DeleteSQL.Strings = (
      'DELETE FROM [dbo].[clientes]'
      '      WHERE [codigocliente] = :codigocliente')
  end
  inherited FDQueryModelo: TFDQuery
    OnNewRecord = FDQueryModeloNewRecord
    Indexes = <
      item
        Fields = 'codigocliente'
      end>
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereChanged
    SQL.Strings = (
      'SELECT [codigocliente]'
      '      ,[nomecliente]'
      '      ,[cep]'
      '      ,[logradouro]'
      '      ,[complemento]'
      '      ,[bairro]'
      '      ,[cidade]'
      '      ,[uf]'
      '      ,[codigoibge]'
      '  FROM [dbo].[clientes]')
    object FDQueryModelocodigocliente: TIntegerField
      FieldName = 'codigocliente'
      Origin = 'codigocliente'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryModelonomecliente: TStringField
      FieldName = 'nomecliente'
      Origin = 'nomecliente'
      Size = 25
    end
    object FDQueryModelocep: TStringField
      FieldName = 'cep'
      Origin = 'cep'
      Size = 10
    end
    object FDQueryModelologradouro: TStringField
      FieldName = 'logradouro'
      Origin = 'logradouro'
      Size = 100
    end
    object FDQueryModelocomplemento: TStringField
      FieldName = 'complemento'
      Origin = 'complemento'
      Size = 15
    end
    object FDQueryModelobairro: TStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 15
    end
    object FDQueryModelocidade: TStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 25
    end
    object FDQueryModelouf: TStringField
      FieldName = 'uf'
      Origin = 'uf'
      Size = 2
    end
    object FDQueryModelocodigoibge: TIntegerField
      FieldName = 'codigoibge'
      Origin = 'codigoibge'
    end
  end
end
