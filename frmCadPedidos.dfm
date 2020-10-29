inherited FormCadPedidos: TFormCadPedidos
  Caption = 'FormCadPedidos'
  ClientHeight = 521
  ClientWidth = 817
  ExplicitWidth = 833
  ExplicitHeight = 560
  PixelsPerInch = 96
  TextHeight = 13
  inherited StatusBar: TStatusBar
    Top = 502
    Width = 817
    ExplicitTop = 502
    ExplicitWidth = 817
  end
  inherited Panel1: TPanel
    Width = 817
    Height = 422
    ExplicitWidth = 817
    ExplicitHeight = 422
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 68
      Height = 13
      Caption = 'C'#243'digo pedido'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 168
      Top = 16
      Width = 52
      Height = 13
      Caption = 'Refer'#234'ncia'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 24
      Top = 56
      Width = 72
      Height = 13
      Caption = 'N'#250'mero pedido'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 644
      Top = 16
      Width = 64
      Height = 13
      Caption = 'Data emiss'#227'o'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 229
      Top = 56
      Width = 33
      Height = 13
      Caption = 'Cliente'
    end
    object Label6: TLabel
      Left = 644
      Top = 56
      Width = 68
      Height = 13
      Caption = 'Tipo opera'#231#227'o'
    end
    object Label8: TLabel
      Left = 25
      Top = 110
      Width = 32
      Height = 19
      Alignment = taRightJustify
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Itens'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label9: TLabel
      Left = 549
      Top = 384
      Width = 100
      Height = 19
      Alignment = taRightJustify
      Anchors = [akLeft, akTop, akRight, akBottom]
      Caption = 'Total do Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object DBText1: TDBText
      Left = 672
      Top = 383
      Width = 117
      Height = 25
      Alignment = taRightJustify
      DataField = 'totalpedido'
      DataSource = DataSourceModelo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 644
      Top = 72
      Width = 145
      Height = 21
      DataField = 'tipooperacao'
      DataSource = DataSourceModelo
      KeyField = 'tipooperacao'
      ListField = 'Descricao'
      ListSource = DSQueryLookupTipoOperacao
      TabOrder = 3
    end
    object DBEdit1: TDBEdit
      Left = 24
      Top = 32
      Width = 138
      Height = 21
      DataField = 'codigopedido'
      DataSource = DataSourceModelo
      Enabled = False
      TabOrder = 4
    end
    object DBEdit2: TDBEdit
      Left = 168
      Top = 32
      Width = 470
      Height = 21
      DataField = 'referencia'
      DataSource = DataSourceModelo
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 24
      Top = 72
      Width = 199
      Height = 21
      DataField = 'numeropedido'
      DataSource = DataSourceModelo
      TabOrder = 1
    end
    object DBEdit4: TDBEdit
      Left = 644
      Top = 32
      Width = 145
      Height = 21
      DataField = 'dataemissao'
      DataSource = DataSourceModelo
      Enabled = False
      TabOrder = 5
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 229
      Top = 72
      Width = 409
      Height = 21
      DataField = 'codigocliente'
      DataSource = DataSourceModelo
      KeyField = 'codigocliente'
      ListField = 'nomecliente'
      ListSource = DSQueryLookupClientes
      TabOrder = 2
    end
    object DBGrid1: TDBGrid
      Left = 24
      Top = 135
      Width = 765
      Height = 234
      DataSource = DataSourceItemsPedido
      TabOrder = 6
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnEditButtonClick = DBGrid1EditButtonClick
      Columns = <
        item
          ButtonStyle = cbsEllipsis
          Expanded = False
          FieldName = 'codigoproduto'
          Title.Caption = 'Produto'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Title.Alignment = taRightJustify
          Title.Caption = 'Qtde.'
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valorunitario'
          Title.Alignment = taRightJustify
          Title.Caption = 'Valor unit'#225'rio'
          Width = 170
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'totalitem'
          Title.Alignment = taRightJustify
          Title.Caption = 'Total'
          Width = 273
          Visible = True
        end>
    end
  end
  inherited pnTitulo: TPanel
    Width = 811
    ExplicitWidth = 811
    inherited lblTitulo: TLabel
      Left = 744
      Width = 51
      Caption = 'Pedidos'
      ExplicitLeft = 744
      ExplicitWidth = 51
    end
  end
  inherited Panel2: TPanel
    Top = 474
    Width = 817
    ExplicitTop = 474
    ExplicitWidth = 817
  end
  inherited ImageList: TImageList
    Left = 712
    Top = 208
  end
  inherited FDUpdateSQLModelo: TFDUpdateSQL
    InsertSQL.Strings = (
      
        'INSERT INTO dbo.pedidos (codigopedido, referencia, numeropedido,' +
        ' dataemissao, codigocliente, tipooperacao, totalpedido)'
      
        'VALUES (:codigopedido, :referencia, :numeropedido, :dataemissao,' +
        ' :codigocliente, :tipooperacao, :totalpedido)')
    ModifySQL.Strings = (
      'UPDATE dbo.pedidos'
      'SET codigopedido = :codigopedido,'
      #9'referencia = :referencia,'
      #9'numeropedido = :numeropedido,'
      #9'dataemissao = :dataemissao,'
      #9'codigocliente = :codigocliente,'
      #9'tipooperacao = :tipooperacao,'
      #9'totalpedido = :totalpedido')
    DeleteSQL.Strings = (
      'DELETE FROM dbo.pedidos'
      'WHERE codigopedido = :codigopedido')
  end
  inherited FDQueryModelo: TFDQuery
    AfterScroll = FDQueryModeloAfterScroll
    OnNewRecord = FDQueryModeloNewRecord
    Indexes = <
      item
      end>
    SQL.Strings = (
      
        'SELECT codigopedido, referencia, numeropedido, dataemissao, codi' +
        'gocliente, tipooperacao, totalpedido'
      'FROM dbo.pedidos'
      '')
    object FDQueryModelocodigopedido: TIntegerField
      FieldName = 'codigopedido'
      Origin = 'codigopedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryModeloreferencia: TStringField
      FieldName = 'referencia'
      Origin = 'referencia'
      Size = 25
    end
    object FDQueryModelonumeropedido: TStringField
      FieldName = 'numeropedido'
      Origin = 'numeropedido'
      Size = 15
    end
    object FDQueryModelodataemissao: TDateField
      FieldName = 'dataemissao'
      Origin = 'dataemissao'
    end
    object FDQueryModelocodigocliente: TIntegerField
      FieldName = 'codigocliente'
      KeyFields = 'codigopedido'
      Origin = 'codigocliente'
      Required = True
    end
    object FDQueryModelotipooperacao: TIntegerField
      FieldName = 'tipooperacao'
      Origin = 'tipooperacao'
      Required = True
    end
    object FDQueryModelototalpedido: TSingleField
      FieldName = 'totalpedido'
      Origin = 'totalpedido'
    end
  end
  object FDQueryLookupClientes: TFDQuery
    CachedUpdates = True
    Connection = DataModuleBase.FDConnection
    SQL.Strings = (
      'SELECT [codigocliente]'
      '      ,[nomecliente]'
      '  FROM [dbo].[clientes]')
    Left = 257
    Top = 250
    object FDQueryLookupClientescodigocliente: TIntegerField
      FieldName = 'codigocliente'
      Required = True
    end
    object FDQueryLookupClientesnomecliente: TStringField
      FieldName = 'nomecliente'
      Size = 25
    end
  end
  object DSQueryLookupClientes: TDataSource
    DataSet = FDQueryLookupClientes
    Left = 273
    Top = 233
  end
  object FDQueryLookupTipoOperacao: TFDQuery
    CachedUpdates = True
    Connection = DataModuleBase.FDConnection
    SQL.Strings = (
      'SELECT 0 as tipooperacao, '#39'Entrada'#39' as Descricao'
      'union'
      'SELECT 1 as tipooperacao, '#39'Sa'#237'da'#39' as Descricao')
    Left = 264
    Top = 322
    object FDQueryLookupTipoOperacaotipooperacao: TIntegerField
      FieldName = 'tipooperacao'
      Origin = 'tipooperacao'
      ReadOnly = True
      Required = True
    end
    object FDQueryLookupTipoOperacaoDescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'Descricao'
      ReadOnly = True
      Required = True
      Size = 7
    end
  end
  object DSQueryLookupTipoOperacao: TDataSource
    DataSet = FDQueryLookupTipoOperacao
    Left = 273
    Top = 306
  end
  object DSQueryLookupProdutos: TDataSource
    DataSet = FDQueryLookupProdutos
    Left = 273
    Top = 369
  end
  object FDQueryLookupProdutos: TFDQuery
    CachedUpdates = True
    Indexes = <
      item
        Active = True
        Selected = True
        Fields = 'codigoproduto'
      end>
    IndexFieldNames = 'codigoproduto'
    DetailFields = 'codigoproduto;descricao'
    Connection = DataModuleBase.FDConnection
    FormatOptions.AssignedValues = [fvDefaultParamDataType]
    FormatOptions.DefaultParamDataType = ftInteger
    SQL.Strings = (
      'SELECT [codigoproduto], [descricao]'
      '  FROM [dbo].[produtos]')
    Left = 257
    Top = 386
    object FDQueryLookupProdutoscodigoproduto: TIntegerField
      FieldName = 'codigoproduto'
      Origin = 'codigoproduto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryLookupProdutosdescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 250
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 416
    Top = 272
    object mnuExcluirItem: TMenuItem
      Caption = 'Excluir item'
    end
  end
  object FDQueryItemsPedido: TFDQuery
    AfterPost = FDQueryItemsPedidoAfterPost
    OnNewRecord = FDQueryItemsPedidoNewRecord
    CachedUpdates = True
    MasterSource = DataSourceModelo
    MasterFields = 'codigopedido'
    DetailFields = 'codigopedido'
    Connection = DataModuleBase.FDConnection
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      'SELECT [codigoproduto]'
      '           , [quantidade]'
      '           , [valorunitario]'
      '           , [totalitem]'
      '           , [codigopedido]'
      'FROM dbo.itemspedido'
      'WHERE  [codigopedido] =  :codigopedido')
    Left = 529
    Top = 250
    ParamData = <
      item
        Name = 'CODIGOPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryItemsPedidocodigoproduto: TIntegerField
      FieldName = 'codigoproduto'
      LookupCache = True
      Origin = 'codigoproduto'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object FDQueryItemsPedidoquantidade: TIntegerField
      FieldName = 'quantidade'
      Origin = 'quantidade'
      OnValidate = FDQueryItemsPedidovalorunitarioValidate
    end
    object FDQueryItemsPedidovalorunitario: TSingleField
      FieldName = 'valorunitario'
      Origin = 'valorunitario'
      OnValidate = FDQueryItemsPedidovalorunitarioValidate
      EditFormat = '#,##0.00'
    end
    object FDQueryItemsPedidototalitem: TSingleField
      FieldName = 'totalitem'
      Origin = 'totalitem'
      EditFormat = '#,##0.00'
    end
    object FDQueryItemsPedidocodigopedido: TIntegerField
      FieldName = 'codigopedido'
      Origin = 'codigopedido'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object FDUpdateSQLItemsPedido: TFDUpdateSQL
    Connection = DataModuleBase.FDConnection
    InsertSQL.Strings = (
      'INSERT INTO dbo.itemspedido'
      '            ([codigoproduto]'
      '           , [quantidade]'
      '           , [valorunitario]'
      '           , [totalitem]'
      '           , [codigopedido])'
      '     VALUES'
      '            (:codigoproduto'
      '           , :quantidade'
      '           , :valorunitario'
      '           , :totalitem'
      '           , :codigopedido)')
    ModifySQL.Strings = (
      'UPDATE [dbo].[itemspedido]'
      '   SET    [codigoproduto] = :codigoproduto'
      '           , [quantidade] = :quantidade'
      '           , [valorunitario] = :valorunitario'
      '           , [totalitem] = :totalitem'
      ' WHERE [codigopedido] = :codigopedido')
    DeleteSQL.Strings = (
      'DELETE FROM [dbo].[itemspedido]'
      ' WHERE [codigopedido] = :codigopedido')
    Left = 529
    Top = 298
  end
  object DataSourceItemsPedido: TDataSource
    DataSet = FDQueryItemsPedido
    OnStateChange = DataSourceModeloStateChange
    Left = 529
    Top = 346
  end
end
