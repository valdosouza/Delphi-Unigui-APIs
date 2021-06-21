inherited SeaMedPosProg: TSeaMedPosProg
  ClientWidth = 406
  Caption = 'Pesquisa de Posi'#231#227'o Programa'#231#227'o de Pe'#231'as'
  ExplicitWidth = 422
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 406
    ExplicitWidth = 406
    inherited pc_search: TUniPageControl
      Width = 402
      ExplicitWidth = 402
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 394
        ExplicitHeight = 105
        inherited pnl_param: TUniPanel
          Width = 394
          ExplicitWidth = 394
          object label1: TUniLabel
            Left = 5
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
          object E_Codigo: TUniEdit
            Left = 5
            Top = 21
            Width = 56
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object E_Description: TUniEdit
            Left = 62
            Top = 21
            Width = 328
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 3
          end
          object label2: TUniLabel
            Left = 63
            Top = 6
            Width = 49
            Height = 14
            Hint = ''
            Caption = 'Descri'#231#227'o'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 4
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 394
        ExplicitHeight = 105
        inherited dbg_Search: TUniDBGrid
          Width = 394
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 336
            end>
        end
      end
    end
    object UniEdit1: TUniEdit
      Left = 104
      Top = -48
      Width = 121
      Hint = ''
      Text = 'UniEdit1'
      TabOrder = 2
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 406
    ExplicitWidth = 406
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
