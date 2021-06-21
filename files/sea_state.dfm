inherited SeaState: TSeaState
  ClientWidth = 381
  Caption = 'Pesquisa de Estados'
  ExplicitWidth = 397
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 381
    ExplicitWidth = 381
    inherited pc_search: TUniPageControl
      Width = 377
      ExplicitWidth = 377
      inherited tbs_param: TUniTabSheet
        ExplicitWidth = 369
        inherited pnl_param: TUniPanel
          Width = 369
          ExplicitWidth = 369
          object L_Descricao: TUniLabel
            Left = 6
            Top = 8
            Width = 87
            Height = 14
            Hint = ''
            Caption = 'Descri'#231#227'o do Pa'#237's'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 1
          end
          object E_Country: TUniEdit
            Left = 2
            Top = 24
            Width = 367
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 2
          end
          object UniLabel1: TUniLabel
            Left = 6
            Top = 52
            Width = 100
            Height = 14
            Hint = ''
            Caption = 'Descri'#231#227'o do Estado'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 3
          end
          object E_State: TUniEdit
            Left = 2
            Top = 68
            Width = 367
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 4
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitWidth = 369
        inherited dbg_Search: TUniDBGrid
          Width = 369
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
            end
            item
              FieldName = 'abbreviation'
              Title.Caption = 'Abreviatura'
              Width = 72
            end
            item
              FieldName = 'name'
              Title.Caption = 'Descri'#231#227'o'
              Width = 252
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 381
    ExplicitWidth = 381
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cds_searchabbreviation: TStringField
      FieldName = 'abbreviation'
      Origin = 'abbreviation'
      Size = 2
    end
    object cds_searchname: TStringField
      FieldName = 'name'
      Origin = 'name'
      Size = 100
    end
  end
end
