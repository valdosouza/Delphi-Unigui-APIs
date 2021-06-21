inherited SeaUser: TSeaUser
  ClientWidth = 652
  Caption = 'Pesquisa Usu'#225'rio'
  ExplicitWidth = 668
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 652
    ExplicitWidth = 652
    inherited pc_search: TUniPageControl
      Width = 648
      ExplicitWidth = 648
      inherited tbs_param: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 640
        ExplicitHeight = 303
        inherited pnl_param: TUniPanel
          Width = 640
          ExplicitWidth = 640
          object L_Name: TUniLabel
            Left = 6
            Top = 3
            Width = 27
            Height = 14
            Hint = ''
            Caption = 'Nome'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 1
          end
          object E_Name_Company: TUniEdit
            Left = 6
            Top = 18
            Width = 630
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            OnChange = E_Name_CompanyChange
          end
          object L_Email: TUniLabel
            Left = 7
            Top = 41
            Width = 63
            Height = 14
            Hint = ''
            Caption = 'e-mail / Login'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 3
          end
          object E_email: TUniEdit
            Left = 6
            Top = 56
            Width = 630
            Hint = ''
            CharCase = ecLowerCase
            Text = ''
            ParentFont = False
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 4
          end
          object chbx_cadAtivo: TUniCheckBox
            Left = 6
            Top = 82
            Width = 136
            Height = 17
            Hint = ''
            Checked = True
            Caption = 'Cadastro Ativo'
            TabOrder = 5
          end
        end
        inherited pnl_config: TUniPanel
          Width = 640
          ExplicitWidth = 640
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 640
        ExplicitHeight = 303
        inherited dbg_Search: TUniDBGrid
          Width = 640
          Columns = <
            item
              FieldName = 'name_company'
              Title.Caption = 'Nome'
              Width = 283
              ReadOnly = True
            end
            item
              FieldName = 'email'
              Title.Caption = 'E-mail'
              Width = 356
              ReadOnly = True
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 652
    ExplicitWidth = 652
  end
  inherited cds_search: TClientDataSet
    object cds_searchname_company: TStringField
      FieldName = 'name_company'
      ReadOnly = True
      Size = 100
    end
    object cds_searchemail: TStringField
      FieldName = 'email'
      ReadOnly = True
      Size = 100
    end
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
    end
  end
end
