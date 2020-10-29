object DataModuleBase: TDataModuleBase
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 266
  Width = 445
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=master'
      'Server=DESKTOP-94F3TTP'
      'OSAuthent=Yes'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 40
    Top = 26
  end
  object FDQuery: TFDQuery
    CachedUpdates = True
    Connection = FDConnection
    Left = 56
    Top = 98
  end
end
