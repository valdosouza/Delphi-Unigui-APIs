inherited SeaIteration: TSeaIteration
  inherited pnl_Top: TUniPanel
    inherited Lb_Numero: TUniLabel
      Width = 218
      Caption = 'Rela'#231#227'o de Atendimentos '
      ExplicitWidth = 218
    end
  end
  inherited pnl_botao: TUniPanel
    object Sb_Atualizar: TUniButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 104
      Height = 48
      Hint = ''
      Caption = 'Atualizar'
      Align = alLeft
      TabOrder = 1
      OnClick = Sb_AtualizarClick
    end
  end
  inherited UniPageControl1: TUniPageControl
    inherited tbs_result: TUniTabSheet
      TabVisible = False
      inherited Dbg_search: TUniDBGrid
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgRowSelect, dgConfirmDelete, dgAutoRefreshRow]
        Columns = <
          item
            FieldName = 'ordem'
            Title.Caption = 'C'#243'digo'
            Width = 88
          end
          item
            FieldName = 'updated_at'
            Title.Caption = 'Data'
            Width = 155
          end
          item
            FieldName = 'comentario'
            Title.Caption = 'Coment'#225'rio'
            Width = 395
          end
          item
            FieldName = 'situacao'
            Title.Caption = 'Situa'#231#227'o'
            Width = 170
          end
          item
            FieldName = 'user_name'
            Title.Caption = 'Usu'#225'rio'
            Width = 203
          end>
      end
    end
  end
  inherited cds_search: TClientDataSet
    Left = 160
    object cds_searchordem: TIntegerField
      FieldName = 'ordem'
      Origin = 'ordem'
      Required = True
    end
    object cds_searchiteracao: TIntegerField
      FieldName = 'iteracao'
      Origin = 'iteracao'
      Required = True
    end
    object cds_searchupdated_at: TDateTimeField
      FieldName = 'updated_at'
      Origin = 'updated_at'
      Required = True
    end
    object cds_searchuser_name: TStringField
      FieldName = 'user_name'
      Origin = 'user_name'
      Required = True
      Size = 100
    end
    object cds_searchcomentario: TStringField
      FieldName = 'comentario'
      Origin = 'comentario'
      Size = 50
    end
    object cds_searchsituacao: TStringField
      FieldName = 'situacao'
      Origin = 'situacao'
      Size = 100
    end
  end
end
