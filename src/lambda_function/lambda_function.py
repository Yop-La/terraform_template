import json
import pandas as pd

def handler(event, context):
    # Créer un DataFrame simple
    df = pd.DataFrame({
        'A': [1, 2, 3, 4],
        'B': [5, 6, 7, 110]
    })

    # Calculer la somme de la colonne 'A'
    sum_column_a = df['A'].sum()

    # Convertir explicitement sum_column_a en int natif de Python
    sum_column_a = int(sum_column_a)

    # Retourner le résultat
    return {
        'statusCode': 200,
        'body': json.dumps({
            'sum_column_a': sum_column_a,
            'message': 'Calcul de la somme réussi!'
        })
    }
