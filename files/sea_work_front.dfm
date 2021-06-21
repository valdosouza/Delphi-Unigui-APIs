inherited SeaWorkFront: TSeaWorkFront
  ClientHeight = 524
  ClientWidth = 560
  Caption = 'Pesquisa de Frentes de Trabalho'
  ExplicitWidth = 576
  ExplicitHeight = 583
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 560
    Height = 460
    ExplicitWidth = 560
    ExplicitHeight = 451
    inherited pc_search: TUniPageControl
      Width = 556
      Height = 456
      ExplicitWidth = 556
      ExplicitHeight = 447
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 548
        ExplicitHeight = 419
        inherited pnl_param: TUniPanel
          Width = 548
          Height = 419
          ExplicitWidth = 548
          ExplicitHeight = 419
          object label1: TUniLabel
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
            TabOrder = 1
          end
          object label2: TUniLabel
            Left = 62
            Top = 6
            Width = 27
            Height = 14
            Hint = ''
            Caption = 'Nome'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 2
          end
          object E_Codigo: TUniEdit
            Left = 3
            Top = 21
            Width = 56
            Hint = ''
            Text = ''
            TabOrder = 3
          end
          object E_Description: TUniEdit
            Left = 48
            Top = 21
            Width = 500
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 4
          end
          object chbx_cadAtivo: TUniCheckBox
            Left = 4
            Top = 45
            Width = 136
            Height = 17
            Hint = ''
            Checked = True
            Caption = 'Cadastro Ativo'
            TabOrder = 5
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 548
        ExplicitHeight = 419
        inherited dbg_Search: TUniDBGrid
          Width = 548
          Height = 419
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 425
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 460
    Width = 560
    ExplicitTop = 451
    ExplicitWidth = 560
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Size = 100
    end
  end
end
