object FormPrincipal: TFormPrincipal
  Left = 0
  Top = 0
  Align = alClient
  Caption = 'CRUD - Julio Bill Schvenger'
  ClientHeight = 414
  ClientWidth = 715
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 664
    Top = 16
    object N1: TMenuItem
      Caption = 'C&adastros'
      object Cliente1: TMenuItem
        Caption = '&Cliente'
        OnClick = Cliente1Click
      end
      object Produtos1: TMenuItem
        Caption = '&Produto'
        OnClick = Produtos1Click
      end
    end
    object Pedidos1: TMenuItem
      Caption = '&Movimenta'#231#227'o'
      object Pedidos2: TMenuItem
        Caption = 'Pe&didos'
        OnClick = Pedidos2Click
      end
    end
  end
end
