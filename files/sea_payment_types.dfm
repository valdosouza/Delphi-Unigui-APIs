inherited SeaPaymentTypes: TSeaPaymentTypes
  ClientWidth = 381
  Caption = 'Pesquisa Modos de Pagamento'
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
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 369
        ExplicitHeight = 105
        inherited pnl_param: TUniPanel
          Width = 369
          ExplicitWidth = 369
          object L_Codigo: TUniLabel
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
          object L_NameCompany: TUniLabel
            Left = 58
            Top = 6
            Width = 49
            Height = 14
            Hint = ''
            Caption = 'Descri'#231#227'o'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 2
          end
          object E_Description: TUniEdit
            Left = 51
            Top = 21
            Width = 318
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 3
          end
          object chbx_cadAtivo: TUniCheckBox
            Left = 4
            Top = 45
            Width = 136
            Height = 17
            Hint = ''
            Checked = True
            Caption = 'Cadastro Ativo'
            TabOrder = 4
          end
          object E_Code: TUniEdit
            Left = 3
            Top = 21
            Width = 53
            Hint = ''
            Text = ''
            TabOrder = 5
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 369
        ExplicitHeight = 105
        inherited dbg_Search: TUniDBGrid
          Width = 369
          Columns = <
            item
              FieldName = 'id'
              Title.Caption = 'C'#243'digo'
              Width = 64
              ReadOnly = True
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 303
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
    Top = 210
    object cds_searchid: TAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 45
    end
  end
end
