export interface MyShakePlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
