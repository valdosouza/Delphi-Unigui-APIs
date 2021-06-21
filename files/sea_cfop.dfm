inherited SeaCfop: TSeaCfop
  ClientHeight = 531
  ClientWidth = 598
  Caption = 'Pesquisa Natureza da Opera'#231#227'o'
  ExplicitWidth = 614
  ExplicitHeight = 569
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 598
    Height = 458
    ExplicitTop = 0
    ExplicitWidth = 598
    ExplicitHeight = 458
    inherited pc_search: TUniPageControl
      Width = 594
      Height = 454
      ExplicitWidth = 594
      ExplicitHeight = 454
      inherited tbs_param: TUniTabSheet
        ExplicitWidth = 586
        ExplicitHeight = 426
        inherited pnl_param: TUniPanel
          Width = 586
          Height = 426
          ExplicitWidth = 586
          ExplicitHeight = 426
          object E_Register: TUniEdit
            Left = 4
            Top = 57
            Width = 73
            Hint = ''
            Text = ''
            TabOrder = 1
          end
          object Rg_way: TUniRadioGroup
            Left = 81
            Top = 42
            Width = 152
            Height = 42
            Hint = ''
            Items.Strings = (
              'Entrada'
              'Sa'#237'da')
            ItemIndex = 1
            Caption = 'Sentido'
            TabOrder = 2
            Columns = 2
          end
          object UniLabel3: TUniLabel
            Left = 82
            Top = 3
            Width = 46
            Height = 13
            Hint = ''
            Caption = 'Descri'#231#227'o'
            TabOrder = 3
          end
          object E_Description: TUniEdit
            Left = 77
            Top = 19
            Width = 509
            Hint = ''
            Text = ''
            TabOrder = 4
          end
          object Rg_Juristiction: TUniRadioGroup
            Left = 237
            Top = 42
            Width = 226
            Height = 42
            Hint = ''
            Items.Strings = (
              'Estadual'
              'Nacional '
              'Exterior')
            ItemIndex = 0
            Caption = 'Al'#231'ada - Abrang'#234'ncia'
            TabOrder = 5
            Columns = 3
          end
          object Rg_Enabled: TUniRadioGroup
            Left = 459
            Top = 42
            Width = 127
            Height = 42
            Hint = ''
            Items.Strings = (
              'Sim'
              'N'#227'o')
            ItemIndex = 0
            Caption = 'Habilitado'
            TabOrder = 6
            Columns = 2
          end
          object c: TUniLabel
            Left = 4
            Top = 42
            Width = 40
            Height = 13
            Hint = ''
            Caption = 'Registro'
            TabOrder = 7
          end
          object UniLabel1: TUniLabel
            Left = 4
            Top = 3
            Width = 27
            Height = 13
            Hint = ''
            Caption = 'CFOP'
            TabOrder = 8
          end
          object E_Cfop: TUniEdit
            Left = 4
            Top = 19
            Width = 73
            Hint = ''
            Text = ''
            TabOrder = 9
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitWidth = 586
        ExplicitHeight = 426
        inherited dbg_Search: TUniDBGrid
          Width = 586
          Height = 426
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'CFOP'
              Width = 64
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 515
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Top = 458
    Width = 598
    ExplicitTop = 458
    ExplicitWidth = 598
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TStringField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 100
    end
  end
end
