#��������� ������ � ���������.
data <- read.table("https://raw.githubusercontent.com/SergeyMirvoda/MD-DA-2018/master/data/gmp.dat", header = TRUE)
gmp <- data.frame(data)
gmp$pop <- gmp$gmp / gmp$pcgmp
estimate.scaling.exponent <- function(a, y0=6611, response=gmp$pcgmp,
                                      predictor = gmp$pop, maximum.iterations=100, deriv.step = 1/100,
                                      step.scale = 1e-12, stopping.deriv = 1/100) {
  mse <- function(a) { mean((response - y0*predictor^a)^2) }
  for (iteration in 1:maximum.iterations) {
    deriv <- (mse(a+deriv.step) - mse(a))/deriv.step
    a <- a - step.scale*deriv
    if (abs(deriv) <= stopping.deriv) { break() }
  }
  fit <- list(a=a,iterations=iteration,
              converged=(iteration < maximum.iterations))
  return(fit)
}
#������ ������ � ��������� ��������� a
k<-estimate.scaling.exponent(0.15)
#� ������� ����������� ������������ ��������� ������ (������� curve) �����������
y0<-6611
curve(y0 * x ^ k$a,
      xlab = "���������",
      ylab = "����� �� ���� ���������",
      from = 1,
      to = 1000)
#������� ����� �� ������ �������� ������ ��������� �������, ��� ���������� �������������� ������ ������������ a?
gmp <- gmp[-c(sample.int(nrow(gmp), 1))]
k$a-estimate.scaling.exponent(0.15)$a #�� ����������
#��������� ������ ��������� ��� � ������ ��������� �����. ��� ���������� �������� a?
estimate.scaling.exponent(0.9999)
estimate.scaling.exponent(0.000001)
estimate.scaling.exponent(0.01)