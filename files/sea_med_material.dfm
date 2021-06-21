inherited SeaMedMaterial: TSeaMedMaterial
  ClientWidth = 554
  Caption = 'Pesquisa de Material'
  ExplicitWidth = 570
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 554
    ExplicitWidth = 554
    inherited pc_search: TUniPageControl
      Width = 550
      ExplicitWidth = 550
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 542
        ExplicitHeight = 105
        inherited pnl_param: TUniPanel
          Width = 542
          ExplicitWidth = 542
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
            TabOrder = 3
          end
          object E_Description: TUniEdit
            Left = 63
            Top = 21
            Width = 333
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 4
          end
          object Cb_destiny: TUniComboBox
            Left = 399
            Top = 21
            Width = 136
            Hint = ''
            ParentShowHint = False
            Style = csDropDownList
            Text = 'Jornais e Revistas'
            Items.Strings = (
              'Jornais e Revistas'
              'R'#225'dios e TV'#39's')
            ItemIndex = 0
            TabOrder = 5
            IconItems = <>
          end
          object UniLabel1: TUniLabel
            Left = 403
            Top = 7
            Width = 45
            Height = 13
            Hint = ''
            Caption = 'Aplica'#231#227'o'
            TabOrder = 6
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 542
        ExplicitHeight = 105
        inherited dbg_Search: TUniDBGrid
          Width = 542
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 430
            end
            item
              FieldName = 'destiny'
              Title.Caption = 'Destino'
              Width = 133
              Visible = False
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 554
    ExplicitWidth = 554
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Required = True
      Size = 100
    end
    object cds_searchdestiny: TIntegerField
      FieldName = 'destiny'
      Required = True
    end
  end
end
