inherited SeaNcm: TSeaNcm
  ClientWidth = 782
  Caption = 'Pesquisar N.C.M.'
  ExplicitWidth = 798
  PixelsPerInch = 96
  TextHeight = 13
  inherited Pnl_Fundo: TUniPanel
    Width = 782
    ExplicitWidth = 782
    inherited pc_search: TUniPageControl
      Width = 778
      ExplicitWidth = 778
      inherited tbs_param: TUniTabSheet
        ExplicitWidth = 770
        inherited pnl_param: TUniPanel
          Width = 770
          ExplicitWidth = 770
          object label1: TUniLabel
            Left = 3
            Top = 6
            Width = 58
            Height = 14
            Hint = ''
            Caption = 'C'#243'digo NCM'
            ParentFont = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clNavy
            Font.Name = 'Arial'
            TabOrder = 1
          end
          object E_Codigo: TUniEdit
            Left = 3
            Top = 21
            Width = 112
            Hint = ''
            Text = ''
            TabOrder = 2
          end
          object label2: TUniLabel
            Left = 118
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
            Left = 118
            Top = 21
            Width = 627
            Hint = ''
            CharCase = ecUpperCase
            Text = ''
            ParentFont = False
            TabOrder = 4
          end
        end
      end
      inherited tbs_search: TUniTabSheet
        ExplicitWidth = 770
        inherited dbg_Search: TUniDBGrid
          Width = 770
          Columns = <
            item
              FieldName = 'number'
              Title.Caption = 'N'#250'mero'
              Width = 64
            end
            item
              FieldName = 'description'
              Title.Caption = 'Descri'#231#227'o'
              Width = 378
            end
            item
              FieldName = 'aliq_nac'
              Title.Caption = 'Aliq Nacional'
              Width = 69
            end
            item
              FieldName = 'aliq_imp'
              Title.Caption = 'Aliq Importado'
              Width = 76
            end
            item
              FieldName = 'aliq_est'
              Title.Caption = 'Aliq Estadual'
              Width = 70
            end
            item
              FieldName = 'aliq_mun'
              Title.Caption = 'Aliq Municipal'
              Width = 70
            end>
        end
      end
    end
  end
  inherited Pnl_Botoes: TUniPanel
    Width = 782
    ExplicitWidth = 782
    inherited Sb_Close: TUniSpeedButton
      Left = 94
      ExplicitLeft = 94
    end
    inherited Sb_View: TUniSpeedButton
      Visible = False
    end
    inherited Sb_Search: TUniSpeedButton
      Left = 2
      ExplicitLeft = 2
    end
    inherited Sb_Register: TUniSpeedButton
      Left = 278
      Visible = False
      ExplicitLeft = 278
    end
  end
  inherited cds_search: TClientDataSet
    object cds_searchnumber: TStringField
      FieldName = 'number'
      Origin = 'number'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 10
    end
    object cds_searchdescription: TStringField
      FieldName = 'description'
      Origin = 'description'
      Size = 150
    end
    object cds_searchaliq_nac: TBCDField
      FieldName = 'aliq_nac'
      Origin = 'aliq_nac'
      DisplayFormat = '0.00'
      Precision = 10
      Size = 3
    end
    object cds_searchaliq_imp: TBCDField
      DisplayLabel = 'aliq_nac'
      FieldName = 'aliq_imp'
      Origin = 'aliq_imp'
      DisplayFormat = '0.00'
      Precision = 10
      Size = 3
    end
    object cds_searchaliq_est: TBCDField
      DisplayLabel = 'aliq_nac'
      FieldName = 'aliq_est'
      Origin = 'aliq_est'
      DisplayFormat = '0.00'
      Precision = 10
      Size = 3
    end
    object cds_searchaliq_mun: TBCDField
      DisplayLabel = 'aliq_nac'
      FieldName = 'aliq_mun'
      Origin = 'aliq_mun'
      DisplayFormat = '0.00'
      Precision = 10
      Size = 3
    end
  end
end
