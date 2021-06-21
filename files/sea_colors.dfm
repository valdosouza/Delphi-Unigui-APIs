inherited SeaColors: TSeaColors
  ClientWidth = 390
  Caption = 'Pesquisa de Cores'
  ExplicitWidth = 406
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Top = 81
    Width = 390
    Height = 391
    ExplicitTop = 81
    ExplicitWidth = 390
    ExplicitHeight = 391
    inherited Grd_Search: TUniDBGrid
      Width = 386
      Height = 387
      Columns = <
        item
          FieldName = 'id'
          Title.Caption = 'C'#243'digo'
          Width = 64
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'description'
          Title.Caption = 'Descri'#231#227'o'
          Width = 261
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
  inherited Pnl_Parametros: TUniPanel
    Width = 390
    Height = 81
    ExplicitWidth = 390
    ExplicitHeight = 81
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 390
    ExplicitWidth = 390
  end
  object L_Codigo: TUniLabel [3]
    Left = 3
    Top = 6
    Width = 33
    Height = 14
    Hint = ''
    Caption = 'C'#243'digo'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Name = 'Arial'
    TabOrder = 3
  end
  object L_NameCompany: TUniLabel [4]
    Left = 65
    Top = 8
    Width = 27
    Height = 14
    Hint = ''
    Caption = 'Nome'
    ParentFont = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Name = 'Arial'
    TabOrder = 4
  end
  object E_Description: TUniEdit [5]
    Left = 65
    Top = 21
    Width = 308
    Hint = ''
    CharCase = ecUpperCase
    Text = ''
    ParentFont = False
    TabOrder = 5
  end
  object E_Codigo: TUniEdit [6]
    Left = 3
    Top = 21
    Width = 56
    Hint = ''
    Text = ''
    TabOrder = 6
    ReadOnly = True
  end
  object chbx_cadAtivo: TUniCheckBox [7]
    Left = 2
    Top = 49
    Width = 136
    Height = 17
    Hint = ''
    Caption = 'Cadastro Ativo'
    TabOrder = 7
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Required = True
      Size = 100
    end
  end
end
