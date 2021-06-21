inherited SeaTbTaxPis: TSeaTbTaxPis
  ClientWidth = 643
  Caption = 'Pesquisa de Situa'#231#227'o Tributaria PIS'
  ExplicitWidth = 659
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Top = 57
    Width = 643
    Height = 415
    ExplicitTop = 57
    ExplicitWidth = 670
    ExplicitHeight = 415
    inherited dbg_Search: TUniDBGrid
      Width = 639
      Height = 411
      Columns = <
        item
          FieldName = 'id'
          Title.Caption = 'C'#243'digo'
          Width = 51
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'group_tax'
          Title.Caption = 'Grupo'
          Width = 61
          CheckBoxField.FieldValues = 'true;false'
        end
        item
          FieldName = 'description'
          Title.Caption = 'Descri'#231#227'o'
          Width = 499
          CheckBoxField.FieldValues = 'true;false'
        end>
    end
  end
  inherited Pnl_Parametros: TUniPanel
    Width = 643
    Height = 57
    ExplicitWidth = 670
    ExplicitHeight = 57
    object L_Codigo: TUniLabel
      Left = 10
      Top = 6
      Width = 33
      Height = 14
      Hint = ''
      Caption = 'C'#243'digo'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 1
    end
    object E_ID: TUniEdit
      Left = 10
      Top = 21
      Width = 56
      Hint = ''
      Text = ''
      TabOrder = 2
      ReadOnly = True
    end
    object UniLabel1: TUniLabel
      Left = 69
      Top = 6
      Width = 30
      Height = 14
      Hint = ''
      Caption = 'Grupo'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 3
    end
    object E_Group: TUniEdit
      Left = 69
      Top = 21
      Width = 56
      Hint = ''
      Text = ''
      TabOrder = 4
      ReadOnly = True
    end
    object L_NameCompany: TUniLabel
      Left = 128
      Top = 6
      Width = 27
      Height = 14
      Hint = ''
      Caption = 'Nome'
      ParentFont = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Name = 'Arial'
      TabOrder = 5
    end
    object E_Description: TUniEdit
      Left = 128
      Top = 21
      Width = 500
      Hint = ''
      CharCase = ecUpperCase
      Text = ''
      ParentFont = False
      TabOrder = 6
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 643
    ExplicitWidth = 670
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchgroup_tax: TStringField
      FieldName = 'group_tax'
      Origin = 'group_tax'
      FixedChar = True
      Size = 2
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 100
    end
  end
end
