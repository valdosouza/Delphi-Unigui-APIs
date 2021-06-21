inherited SeaInteration: TSeaInteration
  Width = 887
  Height = 558
  inherited pnl_Top: TUniPanel
    Width = 887
    inherited Lb_Numero: TUniLabel
      Width = 158
      Caption = 'Lista de Intera'#231#245'es'
      ExplicitWidth = 158
    end
  end
  inherited pnl_botao: TUniPanel
    Width = 881
    object Sb_Atualizar: TUniButton
      AlignWithMargins = True
      Left = 115
      Top = 5
      Width = 104
      Height = 48
      Hint = ''
      Caption = 'Atualizar'
      Align = alLeft
      TabOrder = 1
      OnClick = Sb_AtualizarClick
    end
    object Sb_Interagir: TUniButton
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 104
      Height = 48
      Hint = ''
      Caption = 'Interagir'
      Align = alLeft
      TabOrder = 2
      OnClick = Sb_InteragirClick
    end
  end
  inherited UniPageControl1: TUniPageControl
    Width = 887
    Height = 461
    inherited tbs_result: TUniTabSheet
      Caption = 'Chamado Inicial'
      inherited Dbg_search: TUniDBGrid
        Width = 873
        Height = 427
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgAutoRefreshRow]
        OnDblClick = Dbg_searchDblClick
      end
    end
    object tbs_proposal: TUniTabSheet
      Hint = ''
      Caption = 'Proposta'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 887
      ExplicitHeight = 461
    end
    object tbs_task: TUniTabSheet
      Hint = ''
      Caption = 'Tarefas'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 887
      ExplicitHeight = 461
    end
    object UniTabSheet1: TUniTabSheet
      Hint = ''
      Caption = 'Progressos da Tarefa'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 887
      ExplicitHeight = 461
    end
  end
  inherited cds_search: TClientDataSet
    object cds_searchid: TIntegerField
      FieldName = 'id'
      Required = True
    end
    object cds_searchtb_order_id: TIntegerField
      FieldName = 'tb_order_id'
      Required = True
    end
    object cds_searchupdated_at: TDateTimeField
      FieldName = 'updated_at'
      Required = True
    end
    object cds_searchuser_name: TStringField
      FieldName = 'user_name'
      ReadOnly = True
      Size = 100
    end
    object cds_searchcomentario: TStringField
      FieldName = 'comentario'
      Size = 50
    end
    object cds_searchsituacao: TStringField
      FieldName = 'situacao'
      ReadOnly = True
      Size = 100
    end
  end
end
