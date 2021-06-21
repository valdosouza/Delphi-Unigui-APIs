inherited SeaCity: TSeaCity
  ClientHeight = 424
  ClientWidth = 426
  Caption = 'Pesquisa de Cidades'
  ExplicitWidth = 442
  ExplicitHeight = 462
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 426
    Height = 351
    ExplicitTop = 0
    ExplicitWidth = 426
    ExplicitHeight = 351
    inherited pc_search: TUniPageControl
      Width = 422
      Height = 347
      ExplicitWidth = 422
      ExplicitHeight = 347
      inherited tbs_param: TUniTabSheet
        ExplicitWidth = 414
        ExplicitHeight = 319
        inherited pnl_param: TUniPanel
          Width = 414
          Height = 319
          ExplicitWidth = 414
          ExplicitHeight = 319
          object L_Descricao: TUniLabel
            Left = 5
            Top = 4
            Width = 33
            Height = 14
            Hint = ''
            Caption = 'Estado'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 1
          end
          object E_State: TUniEdit
            Left = 5
            Top = 20
            Width = 48
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 2
          end
          object L_City: TUniLabel
            Left = 55
            Top = 4
            Width = 100
            Height = 14
            Hint = ''
            Caption = 'Descri'#231#227'o da Cidade'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 3
          end
          object E_City: TUniEdit
            Left = 48
            Top = 20
            Width = 366
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 4
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitWidth = 414
        ExplicitHeight = 319
        inherited dbg_Search: TUniDBGrid
          Width = 414
          Height = 319
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
              ReadOnly = True
            end
            item
              FieldName = 'name'
              Title.Caption = 'Cidade'
              Width = 275
            end
            item
              FieldName = 'abbreviation'
              Title.Caption = 'Abreviatura'
              Width = 70
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 351
    Width = 426
    ExplicitTop = 351
    ExplicitWidth = 426
  end
  inherited ds_search: TDataSource
    Left = 128
  end
  inherited cds_search: TClientDataSet
    Left = 136
    Top = 194
    object cds_searchid: TAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cds_searchname: TStringField
      FieldName = 'name'
      Origin = 'name'
      Size = 100
    end
    object cds_searchabbreviation: TStringField
      FieldName = 'abbreviation'
      Origin = 'abbreviation'
      ProviderFlags = []
      ReadOnly = True
      Size = 2
    end
  end
  inherited DSP: TDataSetProvider
    Left = 136
  end
end
