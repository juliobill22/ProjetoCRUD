object FormPesquisa: TFormPesquisa
  Left = 0
  Top = 0
  Caption = 'Pesquisa de Produtos'
  ClientHeight = 206
  ClientWidth = 441
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 425
    Height = 190
    DataSource = DSQueryLookupProdutos
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'codigoproduto'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'descricao'
        Title.Caption = 'Descri'#231#227'o'
        Visible = True
      end>
  end
  object DSQueryLookupProdutos: TDataSource
    DataSet = FDQueryLookupProdutos
    Left = 185
    Top = 61
  end
  object FDQueryLookupProdutos: TFDQuery
    CachedUpdates = True
    Indexes = <
      item
        Active = True
        Selected = True
        Fields = 'codigoproduto'
      end>
    IndexesActive = False
    IndexFieldNames = 'codigoproduto'
    DetailFields = 'codigoproduto;descricao'
    Connection = DataModuleBase.FDConnection
    SQL.Strings = (
      'SELECT *'
      '  FROM [dbo].[produtos]')
    Left = 185
    Top = 109
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
end
